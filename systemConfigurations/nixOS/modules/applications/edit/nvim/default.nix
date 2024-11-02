

# nvim/default.nix

{
  environment.variables.EDITOR = "nvim";
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
  home-manager.users.km = {
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [
      nil
      ltex-ls
      neovide
      gnumake
      pyright
      clang-tools
      tree-sitter
      lua-language-server
    ];
    programs.neovim = {
      enable = true;
      withPython3 = true;
      withNodeJs = true;
    };
    home.stateVersion = "24.05";
  };
}
