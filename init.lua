local global = vim.g

vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.whichwrap:append("<>[]hl")
vim.opt.splitright = true

global.mapleader = " "

require("config.lazy")
require("config.keymappings")
require("config.tree-sitter")
require("config.lualine")
require("config.mason")
require("config.telescope")

vim.cmd.colorscheme "eva01"
