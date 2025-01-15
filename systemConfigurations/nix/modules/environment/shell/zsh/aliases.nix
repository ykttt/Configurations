# zsh/aliases.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target}.programs.zsh.shellAliases = {
    g = "git";
    s = "sudo";
    q = "exit";
    a = "yazi";
    ls = "eza";
    ll = "eza -l";
    j = "journalctl";
    sa = "sudo yazi";
    rb = "sudo nixos-rebuild";
    cl = "sudo nix-collect-garbage";
    rbs = "sudo nixos-rebuild switch";
    cld = "sudo nix-collect-garbage -d";
    mpi = "mpv --config-dir=$HOME/.config/mpv/imgView";
    osm = "onedrive -s --confdir ~/.config/onedrive/main";
    osr = "onedrive -s --confdir ~/.config/onedrive/rits";
  };
}
