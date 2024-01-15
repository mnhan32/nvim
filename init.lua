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

--use system clipboard,
--on archlinux, install xclip for X11 system clipboard
--because nvim on archlinux pacman compile nvim without clipboard
vim.opt.clipboard:append { "unnamed", "unnamedplus" }
--system clipboard, do not how to keep "*p after paste 
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>d", '"+d')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>Y", '"*y')
vim.keymap.set("v", "<leader>D", '"*d')
vim.keymap.set("n", "<leader>P", '"*p')

-- setup leader key
vim.g.mapleader = " "
-- basic key remap
--move lines with ctrl-shift j/k in various modes
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
--vim.keymap.set("n", "<C-S-j>", ":m .+1<CR>==")
--vim.keymap.set("n", "<C-S-k>", ":m .-2<CR>==")
--vim.keymap.set("i", "<C-S-j>", "<Esc>:m .+1<CR>==gi")
--vim.keymap.set("i", "<C-S-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--escape terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n><C-w>w]])

--enable exrc
vim.o.exrc = true

--python executable
vim.g.python3_host_prog = "/usr/bin/python"

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

require("lazy").setup({
  { import = "plugins" },
})

-- colorscheme
vim.cmd[[colorscheme tokyonight]]
