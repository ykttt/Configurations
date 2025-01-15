# starship/default.nix
#
{
  lib,
  sysinfo,
  ...
}: {
  home-manager.users.${sysinfo.target}.programs.starship = {
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
      format = lib.concatStrings [
        "$all"
        "$time"
        "$line_break"
        "$character"
      ];
    };
  };
}
