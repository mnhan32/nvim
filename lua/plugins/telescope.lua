return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep" })
      vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = "Grep String under cursor." })
      vim.keymap.set('n', '<leader>fw', builtin.current_buffer_fuzzy_find, { desc = "Find in current buffer" })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help Tags" })
      vim.keymap.set('n', '<leader>fF', function()
        vim.ui.input({
          prompt = "Find Files in Dir : ",
          completion = "dir",
        }, function(input)
          if input then
            print("Telescope find files in: ", input)
            vim.cmd(string.format("Telescope find_files search_dirs=%s", input))
          end
        end
        )
      end, { desc = "Find Files in Selected Dir." })
    end
  },
  {
    "LukasPietzschmann/telescope-tabs",
    config = function()
      local telescopetabs = require("telescope-tabs")
      telescopetabs.setup({
        vim.keymap.set('n', '<leader>ft', "<CMD>Telescope telescope-tabs list_tabs<CR>", { desc = "Tabs" })
      })
    end
  },
}
