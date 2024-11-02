

# tex/default.nix

{
  home-manager.users.km = {
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [
      mupdf
      texlab
      zathura
      latexrun
      texliveFull
    ];
    home.stateVersion = "24.05";
  };
}
