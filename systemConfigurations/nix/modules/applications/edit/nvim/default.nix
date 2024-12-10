# nvim/default.nix
#
{
  environment.variables.EDITOR = "nvim";
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
  home-manager.users.km = {pkgs, ...}: {
    home.packages = with pkgs; [
      nil
      lldb
      black
      stylua
      ltex-ls
      neovide
      gnumake
      pyright
      alejandra
      codespell
      clang-tools
      tree-sitter
      lua-language-server
    ];
    programs.neovim = {
      enable = true;
      withPython3 = true;
      withNodeJs = true;
    };
    xdg.mimeApps = {
      associations.added = {
        "application/json" = "neovide.desktop";
        "application/x-docbook+xml" = "neovide.desktop";
        "application/x-yaml" = "neovide.desktop";
        "application/x-zerosize" = "neovide.desktop";
        "text/markdown" = "neovide.desktop";
        "text/plain" = "neovide.desktop";
        "text/x-cmake" = "neovide.desktop";
      };
      defaultApplications = {
        "application/json" = "neovide.desktop";
        "application/x-docbook+xml" = "neovide.desktop";
        "application/x-yaml" = "neovide.desktop";
        "application/x-zerosize" = "neovide.desktop";
        "text/markdown" = "neovide.desktop";
        "text/plain" = "neovide.desktop";
        "text/x-cmake" = "neovide.desktop";
      };
    };
    home.stateVersion = "24.05";
  };
}
