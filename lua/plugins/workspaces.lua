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
    "natecraddock/workspaces.nvim",
    config = function()
      local workspaces = require("workspaces")
      workspaces.setup({
        vim.keymap.set('n', '<leader>wf', '<CMD>Telescope workspaces<CR>', { desc = "Find Workspaces" }),
        auto_open = true,
        hooks = {
          open = function()
            local sessions = require("session_manager")
            local lualine = require("lualine")
            local function custom_lualine_c()
              return "Current Workspaces : " .. workspaces.path()
            end
            lualine.setup({
              sections = {
                lualine_c = { custom_lualine_c }
              }
            })
            sessions.load_current_dir_session(true)
            --sessions.load(nil, { silent = true })
          end
        },
      })
      local telescope = require("telescope")
      telescope.load_extension("workspaces")
    end,
  },
}
