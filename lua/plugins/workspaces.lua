--use Dressing for ui.input()
--use cmp-omni and setup "DressingInput" in cmp for path completion
function WorksapceAddUI()
  vim.ui.input({
    prompt = "Workspace Dir : ",
    completion = "dir",
  }, function(input)
    if input then
      print("Adding Workspace ", input)
      vim.cmd(string.format("WorkspacesAdd %s", input))
    end
  end
  )
end

vim.keymap.set('n', '<leader>w', '<Nop>', { desc = "+Workspaces" })
vim.keymap.set('n', '<leader>wa', WorksapceAddUI, { desc = "Add Workspace" })

local wk = require("which-key")
wk.register({
  ["<leader>w"] = {
    name = "+workspaces",
  },
})

return {
  "natecraddock/workspaces.nvim",
  config = function()
    require("workspaces").setup({
      vim.keymap.set('n', '<leader>ws', '<CMD>Telescope workspaces<CR>', { desc = "Find Workspaces" }),
    })
    local telescope = require("telescope")
    telescope.load_extension("workspaces")
  end,
}
