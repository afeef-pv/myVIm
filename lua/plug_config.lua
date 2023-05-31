-- Native LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.tsserver.setup {
    capabilities = capabilities,
    single_file_support = true,
    on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {
            buffer = 0
        })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
            buffer = 0
        })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
            buffer = 0
        })
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {
            buffer = 0
        })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
            buffer = 0
        })
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {
            buffer = 0
        })
        vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {
            buffer = 0
        })
        vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {
            buffer = 0
        })
        vim.keymap.set("n", "<leader>dt", "<cmd>Telescope diagnostics<cr>", {
            buffer = 0
        })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
            buffer = 0
        })
    end
} -- Connect to the server

-- Rust
require'lspconfig'.rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = function()
        print("RUST Analayzer loaded")
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {
            buffer = 0
        })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
            buffer = 0
        })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
            buffer = 0
        })
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {
            buffer = 0
        })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
            buffer = 0
        })
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {
            buffer = 0
        })
        vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {
            buffer = 0
        })
        vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {
            buffer = 0
        })
        vim.keymap.set("n", "<leader>dt", "<cmd>Telescope diagnostics<cr>", {
            buffer = 0
        })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
            buffer = 0
        })
    end,
    cmd = {
      "rustup", "run", "stable", "rust-analyzer"
    }
}

-- GoLnag
require'lspconfig'.gopls.setup {
    capabilities = capabilities,
    on_attach = function()
        print("GoPls loaded")
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {
            buffer = 0
        })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
            buffer = 0
        })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
            buffer = 0
        })
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {
            buffer = 0
        })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
            buffer = 0
        })
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {
            buffer = 0
        })
        vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {
            buffer = 0
        })
        vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {
            buffer = 0
        })
        vim.keymap.set("n", "<leader>dt", "<cmd>Telescope diagnostics<cr>", {
            buffer = 0
        })
    end
}

-- HTML
require'lspconfig'.html.setup{
    capabilities = capabilities,
    on_attach = function()
        print("HTML Loaded")
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {
            buffer = 0
        })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
            buffer = 0
        })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
            buffer = 0
        })
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {
            buffer = 0
        })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
            buffer = 0
        })
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {
            buffer = 0
        })
        vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {
            buffer = 0
        })
        vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {
            buffer = 0
        })
        vim.keymap.set("n", "<leader>dt", "<cmd>Telescope diagnostics<cr>", {
            buffer = 0
        })
    end
}

-- Tailwind
require'lspconfig'.tailwindcss.setup {
    capabilities = capabilities,
    on_attach = function()
        print("TailWind Analayzer loaded")
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {
            buffer = 0
        })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
            buffer = 0
        })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
            buffer = 0
        })
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {
            buffer = 0
        })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
            buffer = 0
        })
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {
            buffer = 0
        })
        vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {
            buffer = 0
        })
        vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {
            buffer = 0
        })
        vim.keymap.set("n", "<leader>dt", "<cmd>Telescope diagnostics<cr>", {
            buffer = 0
        })
    end
} -- Connect to the server
-- Auto Comp nvim-comp
vim.opt.completeopt = {"menu", "menuone", "noselect"}
local cmp = require 'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end
    },
    mapping = {
        ['<C-B>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i','c'}),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i','c'}),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the d>
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        ['<CR>'] = cmp.mapping.confirm({
            select = true
        }) -- Accept currently selected item. Set `>
    },
    sources = cmp.config.sources({{
        name = 'nvim_lsp'
    }}, {{
        name = 'buffer'
    }})
})

-- Telescope
local action_state = require('telescope.actions.state')
require('telescope').setup {
    defaults = {
        prompt_prefix = "$ ",
        mappings = {
            i = {
                ["<c-a>"] = function()
                    print("Telescope works")
                end
            }
        }
    }
}
require('telescope').load_extension('fzf')

local mappings = {}
mappings.curr_buf = function()
    require('telescope.builtin').current_buffer_fuzzy_find()
end
return mappings
