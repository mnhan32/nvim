vim.keymap.set("n", "<leader>n", "<CMD>Neotree toggle<CR>", { desc = "Neotree toggle" })
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    --config = function()
    --  local neotree = require("neo-tree")
    --  neotree.setup({
    --  })
    --end,
    --opts = {
    --  sources = { "filesystem", "buffers", "git_status", "document_symbols" },
    --  open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
    --  filesystem = {
    --    bind_to_cwd = false,
    --    follow_current_file = { enabled = true },
    --    use_libuv_file_watcher = true,
    --  },
    --  window = {
    --    mappings = {
    --      ["<space>"] = "none",
    --    },
    --  },
    --  default_component_configs = {
    --    indent = {
    --      with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
    --      expander_collapsed = "",
    --      expander_expanded = "",
    --      expander_highlight = "NeoTreeExpander",
    --    },
    --  },
    --},
  },
}
