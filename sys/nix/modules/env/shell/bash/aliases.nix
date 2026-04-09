{
  programs.bash.shellAliases = {
    g = "git";
    s = "sudo";
    q = "exit";
    a = "yazi";
    ll = "eza";
    sa = "sudo yazi";
    jc = "journalctl";
    bc = "bluetoothctl";
    rb = "sudo nixos-rebuild";
    cl = "sudo nix-collect-garbage";
    rbs = "sudo nixos-rebuild switch";
    cld = "sudo nix-collect-garbage -d";
    mpi = "mpv --config-dir=$HOME/.config/mpv/imgView";
    osm = "onedrive -s --confdir ~/.config/onedrive/main";
    osr = "onedrive -s --confdir ~/.config/onedrive/rits";
  };
}
