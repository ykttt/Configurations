# Configurations

Mainly configuration files and scripts.

## TO-DOs
### Models
#### Razer Blade 15 (2023)
- [x] Fix speaker issues
  - [x] Apply patch automatically when booting up
  - [x] Get rid of automatically muting issue
- [ ] Support secure boot
- [ ] Make Howdy usable on NixOS
- [ ] Custom keyboard effect
- [ ] Adjust kernel options for gaming performance with nix configuration
- [ ] Boost booting time
### Nix
- [x] Import flakes
- [x] Modularize nix configurations
- [ ] Manage (or integrate) external application dotfiles using nix
### Graphical Environment
#### Hyprland
- [x] Migrate to hyprland
- [x] ~~Replace wofi with anyrun~~
- [x] Import AGS widgets
- [x] Binding configurations
- [x] Improve appearance
- [x] Introduce power management
- [x] Add graphical control interface
- [x] Fix bar showing on the top layer when being full-screen
- [ ] ~~Add automatic theme switch~~
### Applications
#### Neovim
- [ ] Smoothen LaTeX workflow
  - [x] Make vimtex work with uplatex
  - [ ] Set up snippets for LaTeX, etc.
  - [ ] Set up inverse search in both nvim and zathura
- [x] Set up LSP servers without mason.nvim (for it's just not working on NixOS)
  - [x] clangd
  - [x] texlab
  - [ ] ~~lsp_ai~~
  - [x] ltex-ls
  - [x] pyright
  - [x] nil (nix)
  - [x] hls (haskell)
  - [x] lua-language-server
  - [x] ~~bash-language-server~~
- [x] Set up DAP
- [ ] ~Light/dark colour scheme auto-switch~
- [ ] Further configuration of nvim-tree
#### AGS
- [ ] Rewrite app launcher
- [ ] Show window title in status bar
#### llama-cpp
- [x] Employ local chatbot using Llama-3-ELYZA-JP-8B
