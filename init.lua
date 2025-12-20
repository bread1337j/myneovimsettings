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

-- Define the configuration for clangd
vim.lsp.config.clangd = {
	cmd = {
		'clangd',
		'--clang-tidy',
		'--background-index',
		'--offset-encoding=utf-16', -- Note: utf-16 is often preferred by clangd for Neovim
		'--enable-config',          -- This enables .clangd file support
		'--background-index',
		'--query-driver=/usr/bin/gcc',
	},
	root_markers = { '.clangd', 'compile_commands.json', '.git' },
	filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
	capabilities = {
		textDocument = {
			completion = {
				completionItem = {
					snippetSupport = true,
				}
			}
		}
	}
}

-- Then, ensure you actually start/enable the server
vim.lsp.enable('clangd')


vim.cmd("wincmd p")
