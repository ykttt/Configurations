

# basic/zsh.nix

{
  pkgs,
  ...
}: {
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    histSize = 10000;
    histFile = "\${HOME}/.zsh_history";
   };
  home-manager.users.km = {
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [
      pfetch
      pure-prompt
    ];
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        g = "git";
        s = "sudo";
        q = "exit";
        a = "yazi";
        j = "journalctl";
        sa = "sudo yazi";
        ll = "ls -l --color";
        rb = "sudo nixos-rebuild";
        cl = "sudo nix-collect-garbage";
        rbs = "sudo nixos-rebuild switch";
        cld = "sudo nix-collect-garbage -d";
        mpi = "mpv --config-dir=$HOME/.config/mpv/imgView";
        osm = "onedrive -s --confdir ~/.config/onedrive/main";
        osr = "onedrive -s --confdir ~/.config/onedrive/rits";
      };
      plugins = [ {
        name = "zsh-vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "zsh-vi-mode.plugin.zsh";
      } ];
      initExtra = ''
        autoload -U promptinit; promptinit
        prompt pure
        echo "\n" && pfetch
      '';
    };
    home.stateVersion = "24.05";
  };
}
