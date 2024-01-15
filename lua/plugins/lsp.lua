return{
  {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup {}
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
  },
  {
    'neovim/nvim-lspconfig',
  },
  {
    'hrsh7th/nvim-cmp',
  },
  {
    'hrsh7th/cmp-nvim-lsp',
  },
  {
    'hrsh7th/cmp-buffer',
  },
  {
    'hrsh7th/cmp-path',
  },
  {
    'saadparwaiz1/cmp_luasnip',
  },
  {
    'L3MON4D3/LuaSnip',
  },
  {
    'rafamadriz/friendly-snippets',
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    config = function()
      local lsp_zero=require('lsp-zero')
      lsp_zero.extend_lspconfig()
      lsp_zero.on_attach(function(client, bufnr)
        -- keymap on attach
        lsp_zero.default_keymaps({buffer = bufnr})
      end)
      -- setup lua
      require("lspconfig").lua_ls.setup({})
      require("lspconfig").pyright.setup({})
      require("lspconfig").ruff_lsp.setup({})
      -- *******
      -- if I wan to customize lsp setting, ex. lua_ls
      --
      --require('mason-lspconfig').setup({
      --  handlers = {
      --    lsp_zero.default_setup,
      --    lua_ls = function()
      --      local lua_opts = lsp_zero.nvim_lua_ls()
      --      require('lspconfig').lua_ls.setup(lua_opts)
      --    end,
      --  },
      --})
      --
      -- ******
      --cmp autocomplete/suggestion with luasnip ui
      --lsp_zero will set up autocomplete
      --
      --local cmp = require("cmp")
      --local cmp_select = {behavior = cmp.SelectBehavior.Select}
      --cmp.setup({
      --  source = {
      --  {name = 'path'},
      --  {name = 'nvim_lsp'},
      --  {name = 'nvim_lua'},
      --  {name = 'luasnip', keyword_length = 3},
      --  {name = 'buffer', keyword_length = 3},
      --  },
      --  formatting = lsp_zero.cmp_format(),
      --  mapping = cmp.mapping.preset.insert({
      --    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      --    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      --    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
      --    ['<C-Space>'] = cmp.mapping.complete(),
      --  }),
      --})
      --
    end
  },
}
