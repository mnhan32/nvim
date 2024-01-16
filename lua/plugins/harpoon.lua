return {
  {
    "theprimeagen/harpoon",
    --branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("harpoon").setup()
      --keymap harpoon
      --local harpoon=require("harpoon")
      local ui = require("harpoon.ui")
      local mark = require("harpoon.mark")
      vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add to Harpoon" })
      vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, { desc = "Show Harpoon UI" })
      vim.keymap.set("n", "<A-1>", function() ui.nav_file(1) end, { desc = "Nav to Harpoon ID 1" })
      vim.keymap.set("n", "<A-2>", function() ui.nav_file(2) end, { desc = "Nav to Harpoon ID 2" })
      vim.keymap.set("n", "<A-3>", function() ui.nav_file(3) end, { desc = "Nav to Harpoon ID 3" })
      vim.keymap.set("n", "<A-4>", function() ui.nav_file(4) end, { desc = "Nav to Harpoon ID 4" })
      --vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
      --vim.keymap.set("n", "<leader>h", function() ui.toggle_quick_menu(harpoon:list()) end)
      --vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end)
      --vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end)
      --vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end)
      --vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end)
      --vim.keymap.set("n", "<A-5>", function() harpoon:list():select(5) end)
      --
    end
  },
}
