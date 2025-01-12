# tools/basic.nix
#
{
  home-manager.users.km = {pkgs, ...}: {
    home.packages = with pkgs; [
      gcc
      bat
      tree
      unzip
      gnumake
    ];
    programs.zoxide = {
      enable = true;
      options = ["--cmd cd"];
    };
    home.stateVersion = "24.05";
  };
}
