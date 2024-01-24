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
        vim.keymap.set("n", "<leader>wl", "<CMD>SessionManager load_session<CR>", { desc = "Load Sessions" }),
        vim.keymap.set("n", "<leader>wd", "<CMD>SessionManager delete_session<CR>", { desc = "Delete Sessions" }),
        vim.keymap.set("n", "<leader>ws", "<CMD>SessionManager save_current_session<CR>", { desc = "Save Session" }),
      })
    end
  },
}
