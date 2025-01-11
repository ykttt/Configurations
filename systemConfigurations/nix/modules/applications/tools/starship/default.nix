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
          "$all"
        ];
        scan_timeout = 10;
      };
    };
    home.stateVersion = "24.05";
  };
}
