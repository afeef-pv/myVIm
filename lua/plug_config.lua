-- Native LSP
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.tsserver.setup{
    capabilities = capabilities,
    on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
    end
} -- Connect to the server

-- Rust
require'lspconfig'.rust_analyzer.setup{}

-- GoLnag
require'lspconfig'.gopls.setup{}

-- Auto Comp nvim-comp
vim.opt.completeopt={"menu", "menuone", "noselect"}
local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = {
      ['<C-B>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the d>
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `>
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    })
  })

-- Telescope
local action_state = require('telescope.actions.state')
require('telescope').setup {
    defaults = {
        prompt_prefix = "$ ",
        mappings = {
            i = {
                ["<c-a>"] = function() print("Telescope works") end
            }
        }
    }
}
require('telescope').load_extension('fzf')

local mappings = {

}
mappings.curr_buf = function()
require('telescope.builtin').current_buffer_fuzzy_find()
end
return mappings
