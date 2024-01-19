return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Grep" })
      vim.keymap.set('n', '<leader>fw', builtin.current_buffer_fuzzy_find, { desc = "Find in current buffer" })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help Tags" })
    end
  },
}
