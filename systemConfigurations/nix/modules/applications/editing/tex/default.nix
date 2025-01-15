# tex/default.nix
#
{
  pkgs,
  sysinfo,
  ...
}: {
  home-manager.users.${sysinfo.target}.home.packages = with pkgs; [
    mupdf
    texlab
    zathura
    latexrun
    texliveFull
  ];
}
