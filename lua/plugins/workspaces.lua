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

vim.keymap.set('n', '<leader>ww', WorksapceAddUI, { desc = "Add Workspace" })

return {
  {
    "natecraddock/sessions.nvim",
    config = function()
      local sessions = require("sessions")
      sessions.setup({
        events = { "VimLeavePre" },
        session_filepath = vim.fn.stdpath("data") .. "/sessions",
        absolute = true,
      })
      vim.keymap.set('n', '<leader>ws', '<CMD>SessionsSave<CR>', { desc = 'Save Session' })
      vim.keymap.set('n', '<leader>wr', '<CMD>SeessionsLoad<CR>', { desc = 'Load Session' })
    end
  },
  {
    "natecraddock/workspaces.nvim",
    config = function()
      local workspaces = require("workspaces")
      workspaces.setup({
        vim.keymap.set('n', '<leader>wf', '<CMD>Telescope workspaces<CR>', { desc = "Find Workspaces" }),
        auto_open = true,
        hooks = {
          open = function()
            local sessions = require("sessions")
            sessions.load(nil, { silent = true })
          end
        },
      })
      local telescope = require("telescope")
      telescope.load_extension("workspaces")
    end,
  },
}
