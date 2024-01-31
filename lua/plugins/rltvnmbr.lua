-- RltvNmbr, realtive and absolute line number(not hybrid)
-- Show relative number with sign feature,
-- use default vim nu to show absolute number

vim.keymap.set('n', '<leader>rr', "<CMD>RltvNmbr<CR>", { desc = "Show Relative Number" })
vim.keymap.set('n', '<leader>ra', "<CMD>RltvNmbr!<CR>", { desc = "Hide Relative Number" })
return {
  { "vim-scripts/RltvNmbr.vim", },
}
