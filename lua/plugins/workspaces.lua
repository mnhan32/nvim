return {
  "natecraddock/workspaces.nvim",
  config = function()
    require("workspaces").setup({
      vim.keymap.set('n', '<leader>fp', '<CMD>Telescope workspaces<CR>', { desc = "Find Workspaces" })
    })
    local telescope = require("telescope")
    telescope.load_extension("workspaces")
  end,
}
