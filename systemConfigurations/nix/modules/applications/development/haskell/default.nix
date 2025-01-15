# haskell/default.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target} = {pkgs, ...}: {
    home.packages = with pkgs;
      [
        ghc
        nix-prefetch-git
        stylish-haskell
        haskell-language-server
      ]
      ++ (with haskellPackages; [
        hoogle
        fast-tags
        haskell-debug-adapter
      ]);
  };
}
