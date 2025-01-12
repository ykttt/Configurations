#tools/basic.nix
#
{
  home-manager.users.km = {pkgs, ...}: {
    home.packages = with pkgs; [
      gcc
      bat
      btop
      unzip
      gnumake
      trash-cli
    ];
    programs = {
      zoxide = {
        enable = true;
        options = ["--cmd cd"];
      };
      eza = {
        enable = true;
        git = true;
        colors = "auto";
        icons = "auto";
        extraOptions = [
          "--group-directories-last"
          "--header"
        ];
      };
    };
    home.stateVersion = "24.05";
  };
}
