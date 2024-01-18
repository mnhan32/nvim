vim.keymap.set("n", "<leader>u", "<CMD>lua require('undotree').toggle()<CR>", { desc = "Undo Tree Toggle" })
return {
  {
    "jiaoshijie/undotree",
    config = function()
      local undotree = require("undotree")
      undotree.setup({})
    end,
  },
}
