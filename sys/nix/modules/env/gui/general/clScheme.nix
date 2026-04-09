# general/clScheme.nix
#
{sysinfo, ...}: {
  programs.dconf.enable = true;

  home-manager.users.${sysinfo.target} = {
    lib,
    pkgs,
    config,
    inputs,
    ...
  }:
    with pkgs;
    with config.xdg; let
      tmplSpec = let
        mkHook = name: body:
          writeShellScript "clscheme-${name}-hook" ''
            set -euo pipefail
            # Prefix hook logs and send to journald with a stable tag.
            exec > >(stdbuf -oL -eL sed -u 's/^/(${name}) /' | systemd-cat -t clscheme-hooks -p info)
            exec 2>&1
            ${body}
          '';

        gtk3Post = mkHook "matugen-gtk3-post" ''
          # Set GTK3 theme (adw-gtk3 / adw-gtk3-dark).
          schema="org.gnome.desktop.interface"
          gsettings set "$schema" gtk-theme "" || true
          gsettings set "$schema" gtk-theme adw-gtk3$(
            [ "$1" = "Dark" ] && echo "-dark" || echo ""
          ) || true
          echo "set theme to $(gsettings get "$schema" gtk-theme 2>/dev/null || echo "<failed>")"
        '';

        gtk4Post = mkHook "matugen-gtk4-post" ''
          # Set GTK4 color-scheme preference (prefer-dark / default).
          schema="org.gnome.desktop.interface"
          gsettings set "$schema" color-scheme $(
            [ "$1" = "Dark" ] && echo "prefer-dark" || echo "default"
          ) || true
          echo "set colour scheme to $(gsettings get "$schema" color-scheme 2>/dev/null || echo "<failed>")"
        '';
      in
        with lib; {
          gtk3 = {
            remote = true;
            input = "gtk-colors.css";
            path = configHome + "/gtk-3.0/gtk.css";
            post = "${gtk3Post} {{mode}}";
          };

          gtk4 = {
            remote = true;
            input = "gtk-colors.css";
            path = configHome + "/gtk-4.0/gtk.css";
            post = "${gtk4Post} {{mode}}";
          };

          kittyTerm = {
            remote = true;
            input = "kitty-colors.conf";
            path = configHome + "/kitty/colors.conf";
            post = mkHook "matugen-kittyterm-post" ''
              # Reload Kitty colors only if Kitty is actually running.
              if pgrep -x kitty >/dev/null 2>&1; then
                pkill -USR1 kitty && echo "ok" || echo "failed"
              else
                echo "skip (no kitty)"
              fi
            '';
          };

          hypr = {
            remote = true;
            input = "hyprland-colors.conf";
            path = configHome + "/hypr/colors.conf";
            post = mkHook "matugen-hyprland-post" ''
              hyprctl reload || echo "failed"
            '';
          };

          rofi = {
            input = matugenThemes/rofi-colors.rasi;
            path = configHome + "/rofi/colors.rasi";
          };

          pywal = {
            input = matugenThemes/pywal-colors.json;
            path = cacheHome + "/wal/colors.json";
          };

          yazi = {
            remote = true;
            input = "yazi-theme.toml";
            path = configHome + "/yazi/theme.toml";
          };
        };

      commonUnit = {
        After = [
          "graphical-session.target"
          "swww.service"
          # Ensure DBus is up before running hooks that call gsettings.
          "dbus.socket"
          "dbus.service"
        ];
        Wants = [
          "dbus.socket"
          "dbus.service"
        ];
        Requires = ["swww.service"];
        PartOf = ["graphical-session.target"];
      };

      commonServ = {
        Environment = systemdEnv;

        # NOTE:
        # KillMode=process keeps children alive when the oneshot exits.
        # This avoids killing wallpaper transition processes, but systemd may warn
        # about lingering child processes (expected trade-off).
        KillMode = "process";
        Type = "oneshot";
      };

      type = "scheme-fidelity";

      matugenWrapped =
        inputs.matugen.packages.${stdenv.hostPlatform.system}.default
        + "/bin/matugen"
        + " --type ${type}"
        + " --config ${
          (formats.toml {}).generate "matugen-config" {
            config.wallpaper = {
              command = "swww img --transition-type center {{ image }}";
              set = true;
            };
            templates = with lib;
              mapAttrs
              (
                _: v: (
                  {
                    input_path =
                      if (v.remote or false)
                      then inputs.matugenThemes + "/templates/" + v.input
                      else v.input;
                    output_path = v.path;
                  }
                  // optionalAttrs (v ? post) {post_hook = v.post;}
                  // optionalAttrs (v ? pre) {pre_hook = v.pre;}
                )
              )
              tmplSpec;
          }
        }";

      wall = "/wallpaper/currWall";
      latlon = "/wallpaper/latlon.json";

      # sunwait modes: civil / daylight / twilight
      sunwaitMode = "daylight";

      ua = "-H " + "'User-Agent: Mozilla/5.0'";
      url = "https://api.ip.sb/geoip";
      fallbackLat = "35.69N";
      fallbackLon = "139.69E";

      tarPaths = with lib;
        concatMapStringsSep " " (p: "\"" + configHome + p + "\"")
        ((attrValues (mapAttrs (_: v: v.path) tmplSpec)) ++ [latlon wall]);

      systemdEnv = with lib;
        " PATH="
        + makeBinPath [
          coreutils
          curl
          glib
          gnugrep
          gnused
          jq
          procps
          sunwait
          swww
          systemd
        ]
        + " GSETTINGS_SCHEMA_DIR="
        + gsettings-desktop-schemas
        + "/share/gsettings-schemas/"
        + gsettings-desktop-schemas.name
        + "/glib-2.0/schemas"
        + " GIO_EXTRA_MODULES="
        + makeSearchPath "lib/gio/modules" [dconf.lib]
        + " LC_ALL=C"
        + " DEBUG=1";

      readLatLon = writeShellScript "read-latlon" ''
        set -euo pipefail
        if [ -s "${configHome + latlon}" ]; then
          lat="$(jq -r .lat "${configHome + latlon}" 2>/dev/null || echo)"
          lon="$(jq -r .lon "${configHome + latlon}" 2>/dev/null || echo)"
        fi
        if [ -z "''${lat:-}" ] || [ -z "''${lon:-}" ]; then
          lat="${fallbackLat}"; lon="${fallbackLon}"
        fi
        printf '%s %s\n' "$lat" "$lon"
      '';

      updateLatLon = writeShellScript "update-latlon" ''
        set -euo pipefail
        log(){ printf '[clScheme.nix::updateLatLon] %s\n' "$*" >&2; }

        json="$(curl -fsS --max-time 5 ${ua} ${url} || true)"
        [ -n "$json" ] || { log "fetch failed, skip"; exit 0; }

        new_lat="$(jq -r '.latitude'  <<<"$json" 2>/dev/null || echo)N"
        new_lon="$(jq -r '.longitude' <<<"$json" 2>/dev/null || echo)E"
        [ -n "$new_lat" ] && [ -n "$new_lon" ] || { log "coords missing, skip"; exit 0; }

        mkdir -p "${configHome}/wallpaper"
        old_lat=""; old_lon=""; latlon_path="${configHome + latlon}"
        if [ -s "$latlon_path" ]; then
          old_lat="$(jq -r '.lat' "$latlon_path" 2>/dev/null || echo)"
          old_lon="$(jq -r '.lon' "$latlon_path" 2>/dev/null || echo)"
        fi

        if [ "$new_lat" = "$old_lat" ] && [ "$new_lon" = "$old_lon" ]; then
          log "no change, skip"; exit 0
        fi

        old="$(cat "$latlon_path" 2>/dev/null || true)"
        updated="$(
          jq -c --arg lat "$new_lat" --arg lon "$new_lon" '
            (try . catch {})
            | .lat = $lat
            | .lon = $lon
          ' <<<"''${old:-}" 2>/dev/null \
          || jq -n -c --arg lat "$new_lat" --arg lon "$new_lon" '{lat:$lat, lon:$lon}'
        )"
        printf '%s\n' "$updated" > "$latlon_path.tmp"
        mv -f "$latlon_path.tmp" "$latlon_path"
        log "coords updated: $new_lat, $new_lon"

        systemctl --user start clscheme-set.service
      '';

      genNextEvent = writeShellScript "gen-next-event" ''
        set -euo pipefail
        log(){ printf '[clScheme.nix::genNextEvent] %s\n' "$*" >&2; }

        set -- $(${readLatLon})
        lat="$1"; lon="$2"
        log "coords LAT=$lat LON=$lon"

        # Use sunrise/sunset timestamps to determine current mode reliably.
        # Do NOT depend on "sunwait poll" at boundary moments (it can be stale).
        set -- $(
          sunwait list 2 ${sunwaitMode} "$lat" "$lon" \
            | grep -oE '[0-2][0-9]:[0-5][0-9]' \
            | head -n 4 | tr '\n' ' '
        )

        today="$(date +%Y-%m-%d)"
        tomorrow="$(date -d 'tomorrow' +%Y-%m-%d)"

        sr_s="$(date -d "$today $1" +%s)"             # sunrise today
        ss_s="$(date -d "$today $2" +%s)"             # sunset  today
        sr2_s="$(date -d "$tomorrow ''${3:-$1}" +%s)" # sunrise tomorrow (fallback to today)
        ss2_s="$(date -d "$tomorrow ''${4:-$2}" +%s)" # sunset  tomorrow (fallback to today)

        now_s="$(date +%s)"

        if   [ "$now_s" -lt "$sr_s" ]; then
          curr_mode="dark"
          next_ts="$sr_s";  next_mode="light"
        elif [ "$now_s" -lt "$ss_s" ]; then
          curr_mode="light"
          next_ts="$ss_s";  next_mode="dark"
        else
          curr_mode="dark"
          next_ts="$sr2_s"; next_mode="light"
        fi

        log "current mode=$curr_mode"
        log "schedule next: mode=$next_mode at $(date -d "@$next_ts" +%F\ %T)"
        printf '%s %s %s\n' "$curr_mode" "$next_ts" "$next_mode"
      '';

      regSystemd = writeShellScript "reg-systemd" ''
        set -euo pipefail
        log(){ printf '[clScheme.nix::regSystemd] %s\n' "$*" >&2; }

        ts="$1"
        mode="$2"

        # Safety: if we computed a timestamp in the past, bump it slightly forward.
        now="$(date +%s)"
        if [ "$ts" -le "$now" ]; then
          ts=$((now + 2))
          log "next timestamp was in the past; bump to $(date -d "@$ts" +%F\ %T)"
        fi

        log "register clscheme-set-next to systemd"
        systemctl --user stop clscheme-set-next.timer clscheme-set-next.service >/dev/null 2>&1 || true
        systemctl --user reset-failed clscheme-set-next.timer clscheme-set-next.service >/dev/null 2>&1 || true

        systemd-run --user \
          --unit=clscheme-set-next \
          --on-calendar="@$ts" \
          --collect \
          --description="switch to $mode mode" \
          systemctl --user start clscheme-set.service >/dev/null
      '';

      setScheme = writeShellScript "set-scheme" ''
        set -euo pipefail
        log(){ printf '[clScheme.nix::setScheme] %s\n' "$*" >&2; }

        latlon_path="${configHome + latlon}"
        mkdir -p "$(dirname "$latlon_path")"

        old="$(cat "$latlon_path" 2>/dev/null || true)"
        updated="$(
          jq -c --arg mode "$1" '
            (try . catch {}) | .mode = $mode
          ' <<<"''${old:-}" 2>/dev/null \
          || jq -n -c --arg mode "$1" '{mode:$mode}'
        )"
        printf '%s\n' "$updated" > "''${latlon_path}.tmp"
        mv -f "''${latlon_path}.tmp" "$latlon_path"
        log "update ''${latlon_path} -> ''${updated}"

        ${applyMatugen}
      '';

      applyMatugen = writeShellScript "apply-matugen" ''
        set -euo pipefail
        log(){ printf '[clScheme.nix::applyMatugen] %s\n' "$*" >&2; }

        mode="$(jq -r '.mode' "${configHome + latlon}" 2>/dev/null || echo)"
        [ -n "$mode" ] || { log "no mode found in json, abort"; exit 0; }

        img="$(
          head -n1 "${configHome + wall}" | sed 's/[[:space:]]*$//'
        )"
        if [ -z "''${img:-}" ] || [ ! -r "$img" ]; then
          log "invalid image path: ''${img:-<empty>}, abort"; exit 0
        fi

        log "apply new matugen mode: $mode"
        log "apply new wallpaper: $img"

        ${matugenWrapped} -m "$mode" image "$img"

        log "current swww query: $(swww query)"
      '';
    in {
      services.swww.enable = true;

      programs.kitty.settings.include = tmplSpec.kittyTerm.path;

      wayland.windowManager.hyprland = {
        settings = {
          source = [tmplSpec.hypr.path];
          exec-once = [
            (
              "${systemd}/bin/systemctl"
              + " --user import-environment"
              + " WAYLAND_DISPLAY"
              + " XDG_RUNTIME_DIR"
              + " DBUS_SESSION_BUS_ADDRESS"
              + " HYPRLAND_INSTANCE_SIGNATURE"
              + " DISPLAY"
            )
          ];
        };
        systemd.enable = true;
      };

      systemd.user = {
        paths.clscheme-watch-wallpaper = {
          Unit.Description = "watch wallpaper symlink";
          Path = {
            PathModified = configHome + wall;
            Unit = "clscheme-watch-wallpaper.service";
          };
          Install.WantedBy = ["default.target"];
        };

        timers.clscheme-update-latlon = {
          Unit.Description = "timer: lat/lon updater";
          Timer = {
            OnActiveSec = "2s";
            OnUnitActiveSec = "1h";
            AccuracySec = "10s";
            Persistent = true;
          };
          Install.WantedBy = ["default.target"];
        };

        services = {
          clscheme-watch-wallpaper = {
            Unit = commonUnit // {Description = "trigger clscheme-set & swww";};
            Service = commonServ // {ExecStart = applyMatugen;};
          };

          clscheme-update-latlon = {
            Unit.Description = "update lat/lon info via IP geolocation";
            Service = commonServ // {ExecStart = updateLatLon;};
          };

          clscheme-set = {
            Unit = commonUnit // {Description = "set & schedule next colour scheme";};
            Service =
              commonServ
              // {
                ExecStart = writeShellScript "clscheme-set" ''
                  set -euo pipefail
                  set -- $(${genNextEvent})
                  ${setScheme} "$1"
                  ${regSystemd} "$2" "$3"
                '';
              };
            Install.WantedBy = ["graphical-session.target"];
          };

          "clscheme-set-current@" = {
            Unit = commonUnit // {Description = "switch colour scheme to %I manually";};
            Service = commonServ // {ExecStart = "${setScheme} %I";};
          };
        };
      };

      home = {
        packages = [
          adw-gtk3
          glib
          (writeShellScriptBin "setwp" ''
            # Write the wallpaper path to the watched file.
            printf '%s\n' "$*" > "${configHome + wall}"
          '')
        ];

        activation.ensureTargets = lib.hm.dag.entryAfter ["writeBoundary"] ''
          set -euo pipefail
          targets=( ${tarPaths} )
          for f in "''${targets[@]}"; do
            mkdir -p "$(dirname "$f")"
            if [ ! -e "$f" ]; then
              case "$f" in
                *latlon.json) printf '{"lat":null,"lon":null,"mode":null}\n' > "$f" ;;
                *) : > "$f" ;;
              esac
            fi
          done
        '';
      };
    };
}
