# nushell/default.nix
#
{sysinfo, ...}: {
  imports = [../bash];
  home-manager.users.${sysinfo.target} = {
    lib,
    pkgs,
    config,
    ...
  }: let
    nupkg = pkgs.stable.nushell;
  in
    with lib; {
      imports = [./aliases.nix];
      home.packages = [pkgs.macchina];
      programs = let
        nvim = config.programs.neovim.enable;
      in {
        kitty.settings.shell = "${nupkg}/bin/nu";
        nushell = {
          enable = true;
          package = nupkg;
          settings = {
            buffer_editor = mkIf nvim "nvim";
            color_config = {
              shape_external = "red_bold";
              shape_externalarg = "yellow_italic";
              shape_external_resolved = "green";
              shape_internalcall = "green_bold";
            };
            history = {
              file_format = "sqlite";
              max_size = 1000000;
              sync_on_enter = true;
              isolation = true;
            };
            highlight_resolved_externals = true;
            completions.external = {
              enable = true;
              max_results = 200;
            };
            edit_mode = "vi";
            show_banner = false;
          };
          plugins = with pkgs.stable.nushellPlugins; [
            skim
            query
            gstat
            formats
            highlight
            desktop_notifications
          ];
          extraConfig = ''
            echo "\n"; macchina -t greet -o uptime -o host -o distribution -o packages -o kernel -o shell -o processor-load -o memory
          '';
        };
      };
    };
}
