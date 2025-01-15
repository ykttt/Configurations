# zsh/default.nix
#
{pkgs, ...}: {
  imports = [
    ./aliases.nix
    ./preferences.nix
  ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    histSize = 10000;
    histFile = "\${HOME}/.zsh_history";
  };
}
