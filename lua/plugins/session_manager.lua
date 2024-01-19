local wk = require("which-key")
wk.register({
  ["<leader>s"] = {
    name = "+sessions",
  },
})
return {
  {
    "Shatur/neovim-session-manager",
    config = function()
      local session = require("session_manager")
      session.setup({
        vim.keymap.set("n", "<leader>sl", "<CMD>SessionManager load_session<CR>", { desc = "Load Sessions" }),
        vim.keymap.set("n", "<leader>sd", "<CMD>SessionManager delete_session<CR>", { desc = "Delete Sessions" }),
        vim.keymap.set("n", "<leader>ss", "<CMD>SessionManager save_current_session<CR>", { desc = "Save Session" }),
      })
    end
  },
}
