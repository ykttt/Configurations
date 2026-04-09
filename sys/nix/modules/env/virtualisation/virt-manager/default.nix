# virt-manager/default.nix
#
{
  lib,
  pkgs,
  config,
  sysinfo,
  ...
}:
with builtins;
with lib;
with config.hardware; let
  dGPUPassthrough = true; #  currently don't work properly. only supports nVidia card
  winName = "VirtWindows";
  logFile = "/var/log/libvirt-qemu-hook.log";
  safe = dGPUPassthrough && (nBusId != "");
  extractFromBusId = bid: let
    caps = n:
      elemAt (
        match ".*[:@]([0-9]{1,3}):([0-9]{1,2}):([0-9])$"
        bid
      )
      n;
    hex2 = n:
      fixedWidthString 2 "0" (lib.toHexString (toIntBase10 (caps n)));
  in [(hex2 0) (hex2 1) (caps 2)];
  iGPUHex = extractFromBusId iBusId;
  dGPUHex = extractFromBusId nBusId;
  envs = let
    ks = [
      "WLR_DRM_DEVICES"
      "AQ_DRM_DEVICES"
    ];
  in
    listToAttrs (map (k: {
        name = k;
        value = "/dev/dri/igpu-card";
      })
      ks);
in {
  boot.kernelParams = mkIf safe [
    "intel_iommu=on"
    "iommu=pt"
  ];

  services.udev.extraRules = let
    mkRulesFor = name: bdf:
      map
      (n: ''SUBSYSTEM=="drm", KERNEL=="${n.ker}", KERNELS=="0000:${bdf}", SYMLINK+="dri/${name}-${n.sfx}"'')
      [
        {
          ker = "card*";
          sfx = "card";
        }
        {
          ker = "renderD*";
          sfx = "render";
        }
      ];
  in
    concatStringsSep "\n"
    (
      mkRulesFor "igpu"
      "${elemAt iGPUHex 0}:${elemAt iGPUHex 1}.${elemAt iGPUHex 2}"
      ++ optionals safe
      (
        mkRulesFor "dgpu"
        "${elemAt dGPUHex 0}:${elemAt dGPUHex 1}.${elemAt dGPUHex 2}"
      )
    );

  # This should affect all wlroot/aquamarine backended compositors intentionally
  environment.sessionVariables = envs;

  virtualisation = with pkgs; {
    libvirtd = {
      enable = true;
      qemu = {
        package = qemu_kvm;
        swtpm.enable = true;
        vhostUserPackages = [virtiofsd];
      };
      hooks.qemu = mkIf safe (with pkgs; {
        "00-detach-gpu" = writeShellApplication {
          name = "00-detach-gpu";
          runtimeInputs = [kmod systemd libvirt lsof coreutils];
          text = ''
            set -euo pipefail
            echo "$(date) ARGS: $1 $2 $3 $4" >> "${logFile}"
            GUEST="$1"; HOOK="$2"; STAGE="$3"

            if [[ "$GUEST" == "${winName}" && "$HOOK" == "prepare" && "$STAGE" == "begin" ]]; then
              echo "$(date) $GUEST $HOOK $STAGE : detach begin" >> "${logFile}"

              # DRM/KMS suatus check
              if lsof /dev/nvidia* /dev/dri/dgpu-card /dev/dri/dgpu-render >/dev/null 2>&1; then
                echo "$(date) dGPU busy (someone holds /dev/nvidia* or dGPU /dev/dri/*), abort" >> "${logFile}"
                exit 1
              fi

              systemctl --no-block stop nvidia-powerd.service 2>/dev/null || true
              systemctl --no-block stop nvidia-persistenced.service 2>/dev/null || true

              modprobe vfio-pci || true
              virsh nodedev-detach pci_0000_${elemAt dGPUHex 0}_${elemAt dGPUHex 1}_1
              virsh nodedev-detach pci_0000_${elemAt dGPUHex 0}_${elemAt dGPUHex 1}_0

              echo "$(date) $GUEST $HOOK $STAGE : detach end" >> "${logFile}"
            fi
          '';
        };
        "99-reattach-gpu" = writeShellApplication {
          name = "99-reattach-gpu";
          runtimeInputs = [systemd libvirt coreutils];
          text = ''
            set -euo pipefail
            echo "$(date) ARGS: $1 $2 $3 $4" >> "${logFile}"
            GUEST="$1"; HOOK="$2"; STAGE="$3"

            if [[ "$GUEST" == "${winName}" && "$HOOK" == "release" && "$STAGE" == "end" ]]; then
              echo "$(date) $GUEST $HOOK $STAGE : reattach begin" >> "${logFile}"

              virsh nodedev-reattach pci_0000_${elemAt dGPUHex 0}_${elemAt dGPUHex 1}_1 || true
              virsh nodedev-reattach pci_0000_${elemAt dGPUHex 0}_${elemAt dGPUHex 1}_0 || true

              systemctl --no-block start nvidia-persistenced.service 2>/dev/null || true
              systemctl --no-block start nvidia-powerd.service 2>/dev/null || true

              echo "$(date) $GUEST $HOOK $STAGE : reattach end" >> "${logFile}"
            fi
          '';
        };
      });
    };
    spiceUSBRedirection.enable = true;
  };
  hardware.graphics.enable = true;
  networking.firewall.trustedInterfaces = ["virbr0"];
  users.extraGroups.libvirtd.members = [sysinfo.target];
  home-manager.users.${sysinfo.target} = {
    systemd.user.sessionVariables = envs;
    home.packages = with pkgs; [
      (symlinkJoin {
        name = "virt-manager-xwayland";
        paths = [virt-manager virt-viewer];
        buildInputs = [makeWrapper];
        postBuild = ''
          wrapProgram $out/bin/virt-manager \
            --unset WAYLAND_DISPLAY \
            --unset QT_QPA_PLATFORM \
            --set GDK_BACKEND x11 \
            --set SDL_VIDEODRIVER x11
          for b in  $out/bin/virt-viewer $out/bin/remote-viewer; do
            if [ -f "$b" ]; then
              wrapProgram "$b" \
                --unset WAYLAND_DISPLAY \
                --unset QT_QPA_PLATFORM \
                --set GDK_BACKEND x11
            fi
          done
        '';
      })
    ];
    dconf.settings."org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
