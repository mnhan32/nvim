return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    wk.register({
      ["<leader>w"] = {
        name = "+workspaces",
      },
      ["<leader>s"] = {
        name = "+sessions",
      },
      ["<leader>t"] = {
        name = "+toggleterm",
      },
      ["<leader>f"] = {
        name = "+find(telescope)",
      },
      ["<leader>b"] = {
        name = "+bufferline",
      },
    })
  end
}
