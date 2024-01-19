return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = true
  --function()
    --local wk = require("which-key")
    --wk.register(mappings, opts)
    --wk.register({
    --  ["<leader>w"] = {
    --    name = "+workspaces",
    --  },
    --})
  --end
}
