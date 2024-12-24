# haskell/default.nix
#
{
  home-manager.users.km = {pkgs, ...}: {
    home.packages = with pkgs;
      [
        ghc
        cabal-install
        nix-prefetch-git
        stylish-haskell
        haskell-language-server
      ]
      ++ (with haskellPackages; [
        hoogle
        fast-tags
        cabal2nix
        haskell-debug-adapter
      ]);
    home.stateVersion = "24.05";
  };
}
