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
Plug('xiyaowong/transparent.nvim')


vim.call('plug#end')

home = os.getenv("HOME")
package.patch = home .. "/.config/nvim/?.lua;" .. package.path

vim.o.background = "dark"
vim.cmd.colorscheme "everforest"
require("common")
--dofile("theme.lua")
require("vimtree")
require("barbar")

vim.lsp.config('*', {
	root_markers = {'.git'}, 
})

vim.lsp.config('clangd', {
  root_markers = { '.git', '.clang-format', 'compile_commands.json' },
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
        }
      }
    }
  }
})

vim.lsp.config.clangd = {
  cmd = {
  "PATH_TO_CLANGD_HERE",
  },
  root_markers = { '.clangd', 'compile_commands.json' },
  filetypes = { 'c', 'cpp' },
}

vim.lsp.enable('clangd')

vim.cmd("wincmd p")
