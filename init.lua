-- default vim settings
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.rnu = true
vim.o.splitbelow = true
vim.o.splitright =  true
vim.o.mouse = "i"

-- setup leader key
vim.g.mapleader = " "
-- basic key remap
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--enable exrc
vim.o.exrc = true

--python executable
vim.g.python3_host_prog = "/usr/bin/python3.11"

-- lazy vim pacakage management
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- colorscheme
vim.cmd[[colorscheme tokyonight]]
