# zsh/preferences.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target} = {pkgs, ...}: {
    home.packages = [pkgs.macchina];
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      plugins = [
        {
          name = "zsh-vi-mode";
          src = pkgs.zsh-vi-mode;
          file = "zsh-vi-mode.plugin.zsh";
        }
      ];
      initContent = ''
        autoload -U promptinit; promptinit
        echo "\n" && macchina -t greet -o uptime -o host -o distribution -o packages -o kernel -o shell -o processor-load -o memory
      '';
    };
  };
}
