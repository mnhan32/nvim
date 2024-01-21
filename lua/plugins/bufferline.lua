return {
  {
    "tiagovla/scope.nvim",
    config = function()
      vim.opt.sessionoptions = { -- required
          "buffers",
          "tabpages",
          "globals",
      }
      local scope = require("scope")
      scope.setup({})
    end
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local bufferline = require("bufferline")
      bufferline.setup({
        options = {
          numbers = "ordinal", --"both",
          themable = true,
          separator_style = "slant",
          indicator = {
            icon = '|',
            style = 'underline'
          },
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              text_align = "center",
              separator = true,
            }
          },
        },
      })
    end,
    vim.keymap.set("n", "<leader>bb", "<CMD>BufferLineTogglePin<CR>", { desc = "Buffer Pin" }),
    vim.keymap.set("n", "<leader>bd", "<CMD>bd<CR>", { desc = "Buffer Close" }),
    vim.keymap.set("n", "<leader>bD", "<CMD>BufferLineCloseOthers<CR>", { desc = "Buffer Close Others" }),
    vim.keymap.set("n", "<leader>b1", "<Cmd>BufferLineGoToBuffer 1<CR>", { silent = true, desc = "Go To Buffer 1" }),
    vim.keymap.set("n", "<leader>b2", "<Cmd>BufferLineGoToBuffer 2<CR>", { silent = true, desc = "Go To Buffer 2" }),
    vim.keymap.set("n", "<leader>b3", "<Cmd>BufferLineGoToBuffer 3<CR>", { silent = true, desc = "Go To Buffer 3" }),
    vim.keymap.set("n", "<leader>b4", "<Cmd>BufferLineGoToBuffer 4<CR>", { silent = true, desc = "Go To Buffer 4" }),
    vim.keymap.set("n", "<leader>b$", "<Cmd>BufferLineGoToBuffer -4<CR>", { silent = true, desc = "Go To Buffer -4" }),
    vim.keymap.set("n", "<leader>b#", "<Cmd>BufferLineGoToBuffer -3<CR>", { silent = true, desc = "Go To Buffer -3" }),
    vim.keymap.set("n", "<leader>b@", "<Cmd>BufferLineGoToBuffer -2<CR>", { silent = true, desc = "Go To Buffer -2" }),
    vim.keymap.set("n", "<leader>b!", "<Cmd>BufferLineGoToBuffer -1<CR>", { silent = true, desc = "Go To Buffer -1" }),
    vim.keymap.set("n", "<A-.>", "<CMD>BufferLineCycleNext<CR>", { desc = "Buffer next" }),
    vim.keymap.set("n", "<A-,>", "<CMD>BufferLineCyclePrev<CR>", { desc = "Buffer previous" }),
  },
}
