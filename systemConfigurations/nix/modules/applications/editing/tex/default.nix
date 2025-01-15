# tex/default.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target} = {pkgs, ...}: {
    home.packages = with pkgs; [
      mupdf
      texlab
      zathura
      latexrun
      texliveFull
    ];
  };
}
