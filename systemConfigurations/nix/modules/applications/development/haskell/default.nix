# haskell/default.nix
#
{
  pkgs,
  sysinfo,
  ...
}: {
  home-manager.users.${sysinfo.target}.home.packages = with pkgs;
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
}
