return {
  {
    "Shatur/neovim-session-manager",
    config = function()
      local session = require("session_manager")
      session.setup({})
    end
  },
}
