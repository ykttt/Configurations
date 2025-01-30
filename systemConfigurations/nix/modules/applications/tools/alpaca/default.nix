# alpaca/default.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target} = {pkgs, ...}: {
    home.packages = [
      pkgs.alpaca.override
      {
        ollama = pkgs.ollama-cuda;
      }
    ];
  };
}
