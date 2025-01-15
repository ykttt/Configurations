# git/default.nix
#
{sysinfo, ...}: {
  imports = [./config.nix];
  home-manager.users.${sysinfo.target} = {pkgs, ...}: {
    home.packages = [pkgs.gh];
    programs.ssh.matchBlocks.km = {
      port = 443;
      host = "ssh.github.com";
      identityFile = ["/home/km/.ssh/id_ed25519"];
    };
    programs.git = {
      enable = true;
      lfs.enable = true;
    };
  };
}
