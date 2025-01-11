# starship/default.nix
#
{
  home-manager.users.km = {
    pkgs,
    lib,
    ...
  }: {
    programs.starship = {
      enable = true;
      settings = {
        add_newline = false;
        format = lib.concatStrings [
          "$line_break"
          "$package"
          "$line_break"
          "$character"
        ];
        scan_timeout = 10;
        character = {
          success_symbol = "➜";
          error_symbol = "➜";
        };
      };
    };
    home.stateVersion = "24.05";
  };
}
