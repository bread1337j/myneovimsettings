vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
]])

local vim = vim
local Plug = vim.fn['plug#']


vim.call('plug#begin')

Plug('sainnhe/everforest')
Plug('kyazdani42/nvim-tree.lua')
Plug('kyazdani42/nvim-web-devicons')
Plug('romgrk/barbar.nvim')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

vim.call('plug#end')

home = os.getenv("HOME")
package.patch = home .. "/.config/nvim/?.lua;" .. package.path

vim.o.background = "dark"
vim.cmd.colorscheme "everforest"
require("common")
--dofile("theme.lua")
require("vimtree")
require("barbar")
