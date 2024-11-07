

# basic/default.nix

{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    pfetch
    pciutils
    pure-prompt
    zsh-vi-mode
  ];
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 10000;
    histFile = "\${HOME}/.zsh_history";
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
      opm = "onedrive -s --confdir ~/.config/onedrive/main";
      opr = "onedrive -s --confdir ~/.config/onedrive/rits";
    };
    interactiveShellInit = ''
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
    '';
    promptInit = ''
      autoload -U promptinit; promptinit
      prompt pure
      echo "\n" && pfetch
    '';
  };
  users.defaultUserShell = pkgs.zsh;
  home-manager.users.km = {
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [
      gcc
      w3m
      mpv
      nemo
      discord
      onedrive
      thunderbird
    ];
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      package = pkgs.yazi.override {
        _7zz = (pkgs._7zz.override { useUasm = true; });
      };
    };
    home.stateVersion = "24.05";
  };
}
