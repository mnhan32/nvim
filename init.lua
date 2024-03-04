-- default vim settings
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
--vim.opt.rnu = true
-- learn to use absolute line number
vim.opt.nu = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.mouse = "a"
--always show tabline
--vim.opt.showtabline = 2
--popup menu transparency
vim.opt.pumblend = 20
vim.opt.colorcolumn = "79"
vim.opt.termguicolors = true
vim.opt.inccommand = "split"
vim.opt.virtualedit = "block"
--use system clipboard,
--on archlinux, install xclip for X11 system clipboard
--because nvim on archlinux pacman compile nvim without clipboard
--vim.opt.clipboard:append { "unnamed", "unnamedplus" }
vim.opt.clipboard = "unnamedplus"
--system clipboard, do not how to keep "*p after paste
vim.keymap.set("v", "<leader>y", '"+y', { desc = "+Yank" })
vim.keymap.set("v", "<leader>d", '"+d', { desc = "+Cut" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "+Paste" })
vim.keymap.set("v", "<leader>Y", '"*y', { desc = "*Yank" })
vim.keymap.set("v", "<leader>D", '"*d', { desc = "*Cut" })
vim.keymap.set("n", "<leader>P", '"*p', { desc = "*Paste" })

--map buffer close
vim.keymap.set("n", "<A-x>", "<CMD>bd<CR>", { desc = "Buffer delete." })

-- setup leader key
vim.g.mapleader = " "
-- basic key remap
--move lines with ctrl-shift j/k in various modes
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Explorer" })
--vim.keymap.set("n", "<C-S-j>", ":m .+1<CR>==")
--vim.keymap.set("n", "<C-S-k>", ":m .-2<CR>==")
--vim.keymap.set("i", "<C-S-j>", "<Esc>:m .+1<CR>==gi")
--vim.keymap.set("i", "<C-S-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Shift Selection Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Shift Selection Up" })

--escape bufferlineeee
vim.keymap.set("t", "<Esc>", [[<C-\><C-n><C-w>w]], { desc = "Escape terminal" })

--enable exrc
vim.opt.exrc = true

--python executable
--vim.g.python3_host_prog = "/usr/bin/python"


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

-- add a command to copy current filepath
vim.api.nvim_create_user_command("CopyFilePath", function()
  local path = vim.fn.expand("%:p")
  if vim.loop.os_uname().sysname:find 'Windows' and true or false then
    --vim.notify("hey, windows")
    path = path:gsub("/", "\\");
  end
  vim.fn.setreg("+", path)
  vim.notify('File Path : ' .. path)
end, {})

-- add a command to copy current file directory
vim.api.nvim_create_user_command("CopyFileDirectory", function()
  local path = vim.fn.expand("%:p:h")
  if vim.loop.os_uname().sysname:find 'Windows' and true or false then
    --vim.notify("hey, windows")
    path = path:gsub("/", "\\");
  end
  vim.fn.setreg("+", path)
  vim.notify('File Directory : ' .. path)
end, {})

-- add a command to copy current filename
vim.api.nvim_create_user_command("CopyFileName", function()
  local path = vim.fn.expand("%:t")
  vim.fn.setreg("+", path)
  vim.notify('File Name : ' .. path)
end, {})

-- set fonts
vim.opt.guifont = "FiraMono Nerd Font Mono:h12"
--neovide config
if vim.g.neovide then
  vim.g.neovide_scroll_animation_length = 0.1;
  vim.g.neovide_cursor_trail_size = 0;
end
