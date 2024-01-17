return {
  { 'williamboman/mason.nvim', },
  { 'williamboman/mason-lspconfig.nvim', },
  { 'neovim/nvim-lspconfig', },
  { 'hrsh7th/nvim-cmp', },
  { 'hrsh7th/cmp-nvim-lsp', },
  { 'hrsh7th/cmp-buffer', },
  { 'hrsh7th/cmp-path', },
  { 'saadparwaiz1/cmp_luasnip', },
  { 'L3MON4D3/LuaSnip', },
  { 'rafamadriz/friendly-snippets', },
  { 'lukas-reineke/lsp-format.nvim', },
  { 'hedyhli/outline.nvim', },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    config = function()
      -- **********
      --lsp format for lsp zero
      require("lsp-format").setup({})
      -- ***********
      -- use mason
      require("mason").setup({})

      --*************
      --lsp zeo setup
      local lsp_zero = require('lsp-zero')
      local lsp_format = require('lsp-format')
      lsp_zero.extend_lspconfig()
      lsp_zero.on_attach(function(client, bufnr)
        -- keymap on attach
        lsp_zero.default_keymaps({ buffer = bufnr })
        --
        -- this is to make sure client has format capbilities
        -- lsp-format provide async way
        if client.supports_method('textdocument/formatting') then
          lsp_format.on_attach(client)
        end
        -- keybind to autoformat
        local opts = { buffer = bufnr }
        vim.keymap.set({ 'n', 'x' }, 'gq', function()
          vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
        end, opts)
      end)
      -- end of lsp zero setup

      -- ************
      -- lspconfig
      require("lspconfig").lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' },
            },
          },
        },
      })
      require("lspconfig").pylsp.setup({})
      --require("lspconfig").pyright.setup({})
      --require("lspconfig").ruff_lsp.setup({})
      -- end of lspconfig
      -- ******
      --cmp autocomplete/suggestion with luasnip
      local cmp = require("cmp")
      local cmp_action = require("lsp-zero").cmp_action()
      require("luasnip.loaders.from_vscode").lazy_load()
      --this toggle cmp on/off
      vim.g.cmptoggle = true
      vim.keymap.set("n", "<leader>tc", "<cmd>lua vim.g.cmptoggle = not vim.g.cmptoggle<CR>",
        { desc = "Toggle nvim-cmp" })
      cmp.setup({
        enabled = function()
          return vim.g.cmptoggle
        end,
        sources = cmp.config.sources({
          { name = 'nvim_lsp', keyword_length = 5,  priority = 30 },
          { name = 'path',     priority = 10 },
          { name = 'luasnip',  keyword_length = 2,  priority = 5 },
          { name = 'buffer',   priority = 20 },
        }),
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping({
          ['<Tab>'] = cmp_action.tab_complete(),
          ['S<Tab>'] = cmp_action.select_prev_or_fallback(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<Up>'] = cmp.mapping.abort(),
          ['<Down>'] = cmp.mapping.abort(),
          ['<Left>'] = cmp.mapping.abort(),
          ['<Right>'] = cmp.mapping.abort(),
        }),
      })
      --
      --end of cmp config
      -- **
      -- outline
      local outline = require("outline")
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
      outline.setup({
        symbols = {
          filter = {
            default = { 'String', exclude = true },
            python = { 'Function', 'Class' },
          }
        }
      })
      --
      -- end of outline config
    end
  },
}
