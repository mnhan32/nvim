return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- ":TSInstallFromGrammar", -- ":TSInstall",
    config = function()
      -- use curl, for some reason git is not stable on my laptop
      require("nvim-treesitter.install").prefer_git = false
      -- on window 64, I use zig to compile parser
      require("nvim-treesitter.install").compilier = { "clang", "gcc", "zig" }
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c", "lua", "vim", "vimdoc", "query",
          "python", "markdown", "sql", "cpp", "csv",
          "xml", "yaml", "json", "javascript", "html"
        },
        auto_install = true,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
}
