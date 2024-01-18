--local M = {}
--function M.input()
--  vim.ui.input({
--    prompt = "Workspace Name : "
--  }, function(input)
--    if input then
--      print("you enter ...", input)
--    end
--  end
--  )
--end

--vim.keymap.set('n', '<leader>wa', M.input())

return {
  "natecraddock/workspaces.nvim",
  config = function()
    require("workspaces").setup({
      vim.keymap.set('n', '<leader>fp', '<CMD>Telescope workspaces<CR>', { desc = "Find Workspaces" }),
    })
    local telescope = require("telescope")
    telescope.load_extension("workspaces")
  end,
}
