#tools/basic.nix
#
{
  pkgs,
  sysinfo,
  ...
}: {
  environment.systemPackages = [pkgs.xfs-undelete];
  home-manager.users.${sysinfo.target} = {pkgs, ...}: {
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
  };
}
