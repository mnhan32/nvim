return {
  {
    "Shatur/neovim-session-manager",
    config = function()
      local session = require("session_manager")
      local Path = require("plenary.path")
      local config = require("session_manager.config")
      session.setup({
        autoload_mode = config.AutoloadMode.CurrentDir,
        autosave_last_session = false,
        autosave_ignore_filetypes = {
          'gitcommit',
          'gitrebase'
        },
        vim.keymap.set("n", "<leader>sl", "<CMD>SessionManager load_session<CR>", { desc = "Load Sessions" }),
        vim.keymap.set("n", "<leader>sd", "<CMD>SessionManager delete_session<CR>", { desc = "Delete Sessions" }),
        vim.keymap.set("n", "<leader>ss", "<CMD>SessionManager save_current_session<CR>", { desc = "Save Session" }),
      })
    end
  },
}
