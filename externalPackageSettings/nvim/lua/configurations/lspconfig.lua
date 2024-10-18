

-- configurations/lspconfig.lua


local cmp = require'cmp'

cmp.setup({
        snippet = {
                expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
        },
        window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<C-n>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'vimtex', },
        }, {
                { name = 'buffer' },
        })
})

cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
                { name = 'git' },
        }, {
                { name = 'buffer' },
        })
})

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
                { name = 'buffer' }
        }
})

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
                { name = 'path' }
        }, {
                { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
})

require'cmp_git'.setup()

-- Set up lspconfig.
local capabilities = require'cmp_nvim_lsp'.default_capabilities()

require'lspconfig'.pyright.setup { capabilities = capabilities }
require'lspconfig'.clangd.setup { capabilities = capabilities }
require'lspconfig'.texlab.setup { capabilities = capabilities }
require'lspconfig'.bashls.setup { capabilities = capabilities }
require'lspconfig'.nil_ls.setup { capabilities = capabilities }
require'lspconfig'.lsp_ai.setup {
        capabilities = capabilities,
        models = {
                model1 = {
                        type = "ollama",
                        model = "deepseek-coder"
                },
        },
        chat = {
                trigger = "!C",
                action_display_name = "Chat",
                model = "model1",
                parameters = {
                        max_context = 4096,
                        max_tokens = 1024,
                        system = "Assist the user."
                }
        }
}
require'lspconfig'.lua_ls.setup {
        capabilities = capabilities,
        on_init = function(client)
                if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
                                return
                        end
                end
                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                        runtime = {
                        -- Tell the language server which version of Lua you're using
                        -- (most likely LuaJIT in the case of Neovim)
                                version = 'LuaJIT'
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                                checkThirdParty = false,
                                library = {
                                        vim.env.VIMRUNTIME
                                -- Depending on the usage, you might want to add additional paths here.
                                -- "${3rd}/luv/library"
                                -- "${3rd}/busted/library",
                                }
                        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                        -- library = vim.api.nvim_get_runtime_file("", true)
                        }
                })
        end,
        settings = { Lua = {} }
}
