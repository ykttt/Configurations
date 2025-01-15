# nvim/default.nix
#
{
  pkgs,
  config,
  sysinfo,
  ...
}: {
  environment.variables.EDITOR = "nvim";
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
  home-manager.users.${sysinfo.target} = {
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
    home.file."${config.home.homeDirectory}/.config/nvim".source =
      config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/repositories/configurations/externalConfigurations/nvim";
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
  };
}
