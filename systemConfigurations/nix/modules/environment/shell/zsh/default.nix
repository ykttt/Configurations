# zsh/default.nix
#
{pkgs, ...}: {
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    histSize = 10000;
    histFile = "\${HOME}/.zsh_history";
  };
  home-manager.users.km = {pkgs, ...}: {
    home.packages = [pkgs.macchina];
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
      plugins = [
        {
          name = "zsh-vi-mode";
          src = pkgs.zsh-vi-mode;
          file = "zsh-vi-mode.plugin.zsh";
        }
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.8.0";
            sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
          };
        }
      ];
      initExtra = ''
        autoload -U promptinit; promptinit
        echo "\n" && macchina -t greet -o uptime -o host -o distribution -o packages -o kernel -o shell -o processor-load -o memory
      '';
    };
    home.stateVersion = "24.05";
  };
}
