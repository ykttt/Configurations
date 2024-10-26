# Configurations

Mainly configuration files and scripts.

## TO-DOs
### Models
#### Razer Blade 15 (2023)
- [x] Fix speaker issues
    - [x] Apply patch automatically when booting up
    - [x] Get rid of automatically muting issue
- [ ] Support secure boot
- [ ] Make custom keyboard effect scripts running on NixOS
- [ ] Adjust kernel options for gaming performance with nix configuration
- [ ] Boost booting time
### Nix
- [x] Import flakes
- [ ] Modularise nix configurations
- [ ] Manage (or intergrate) external application dotfiles using nix
### Graphical Environment
#### Hyprland
- [x] Migrate to hyprland
- [x] Replace wofi with anyrun
- [ ] Import AGS widgets
- [ ] Keybinding configurations
- [ ] Improve appearance
- [ ] Introduce power management
- [ ] Add graphical control interface
- [ ] Add IPC support for hyprland
- [ ] Add automatic theme switch
### Applications
#### Neovim 
- [ ] Smoothen LaTeX workflow
    - [x] Make vimtex work with platex
    - [ ] Set up snippets for LaTeX, etc.
    - [ ] Set up inverse search in both nvim and zathura
- [x] Set up LSP servers without mason.nvim (for it's just not working on NixOS)
    - [x] clangd
    - [x] texlab
    - [ ] ~~lsp_ai~~
    - [x] ltex-ls
    - [x] pyright
    - [x] nil (nix)
    - [x] ~~hls (haskell)~~
    - [x] lua-language-server
    - [x] ~~bash-language-server~~
- [ ] Light/dark colour scheme auto-switch
- [ ] Further configuration of nvim-tree
