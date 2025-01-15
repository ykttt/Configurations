# starship/default.nix
#
{
  config,
  sysinfo,
  ...
}: {
  home-manager.users.${sysinfo.target} = {lib, ...}:
    with lib; {
      programs.starship = {
        enable = true;
        settings = {
          add_newline = false;
          scan_timeout = 10;
          directory = {
            truncation_length = 3;
            truncate_to_repo = true;
            fish_style_pwd_dir_length = 1;
          };
          time = {
            disabled = false;
            time_format = " %H:%M";
            style = "bold pink";
          };
          battery.display = mkIf config.hardware.laptop [
            {
              threshold = 10;
              style = "bold red";
            }
            {
              threshold = 20;
              style = "bold orange";
            }
            {
              threshold = 50;
              style = "bold yellow";
            }
            {
              threshold = 90;
              style = "bold blue";
            }
            {
              threshold = 100;
              style = "bold green";
            }
          ];
          format = concatStrings [
            "$all"
            "$time"
            "$line_break"
            "$character"
          ];
        };
      };
    };
}
