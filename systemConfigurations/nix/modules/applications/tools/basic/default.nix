#tools/basic.nix
#
{
  pkgs,
  sysinfo,
  ...
}: {
  home-manager.users.${sysinfo.target} = {
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
