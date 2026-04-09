# Neovim Configuration

This repository contains my Neovim configuration built with Lua and managed using the `lazy.nvim` plugin manager.

## Structure

- `init.lua` - Entry point for Neovim startup, loads `lua/plugins.lua` and base settings
- `lua/` - Main Lua configuration files:
  - `plugins.lua` - Plugin specifications managed by `lazy.nvim`
  - `configurations/` - Individual plugin and feature configurations (LSP, treesitter, UI, etc.)
  - `keymaps/` - Key mapping definitions separated by category
  - `luasnippets/` - User-defined LuaSnip snippets
- `after/` - Filetype-specific settings and overrides loaded after plugins

## Requirements

1. Neovim (>=0.8)

## Customization

- Add or modify plugins in `lua/plugins.lua`
- Configure plugins by editing files under `lua/configurations/`
- Define custom keybindings in `lua/keymaps/`
- Add or edit snippets in `luasnippets/`

## Notes

- This configuration is **still unstable** and has only been tested in the author's personal environment. Expect bugs or unexpected behavior if you try to use it elsewhere.