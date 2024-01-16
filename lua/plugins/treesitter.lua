return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- use curl, for some reason git is not stable on my laptop
      require("nvim-treesitter.install").prefer_git = false
      -- on window 64, I use zig to compile parser
      require("nvim-treesitter.install").compilier = { "clang", "gcc", "zig", "msvc" }
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c", "lua", "python", "markdown",
          "vim", "vimdoc", "query", "elixir",
          "heex", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
}
