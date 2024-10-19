# Configurations

Mainly configuration files and scripts.

## TODOs
### Models
#### Razer Blade 15 (2023)
- [ ] Fix speaker issues
    - [x] Apply patch automatically when booting up
    - [ ] Get rid of automatically muting issue
- [ ] Support secure boot
- [ ] Make custom keybboard effect scripts running on NixOS
- [ ] Adjust kernel options for gaming performance with nix configuration
- [ ] Boost booting time
### Nix
- [ ] Import flakes
- [ ] Modularise nix configurations
- [ ] Manage (or intergrate) external application dotfiles using nix
### Graphical Environment
#### Hyprland
- [ ] Migrate to hyprland
- [ ] Add IPC support
### Applications
#### Neovim 
- [ ] Smoothen LaTeX workflow
    - [x] Make vimtex work with platex
    - [ ] Set up snippets for LaTeX, etc.
    - [ ] Set up inverse search in both nvim and zathura
- [ ] Set up LSP servers without mason.nvim (for it's just not working on NixOS)
    - [x] nil (nix)
    - [x] clangd
    - [x] pyright
    - [ ] hls (haskell)
    - [x] texlab
    - [x] lua-language-server
    - [x] bash-language-server
    - [ ] lsp_ai
- [ ] Further configuration of nvim-tree
- [ ] Light/dark colourcheme autoswitch
