

-- configurations/lspconfig.lua


local cmp = require'cmp'

require("mason-lspconfig").setup{
        ensure_installed = {
                "grammarly",
                "omnisharp",
                "ast_grep",
                "bashls",
                "rnix",
        },
}

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

require("cmp_git").setup() 

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").grammarly.setup { capabilities = capabilities }
require("lspconfig").ast_grep.setup { capabilities = capabilities }
require("lspconfig").bashls.setup { capabilities = capabilities }
require("lspconfig").rnix.setup { capabilities = capabilities }
require("lspconfig").hls.setup { capabilities = capabilities }



