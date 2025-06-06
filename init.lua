require("config.lazy")

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader      = " "
vim.g.maplocalleader = "\\"

vim.g.have_nerd_font = true		-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.o.number	  = true		-- Make line numbers default
vim.o.relativenumber = true		-- Enable relative line numbers
vim.o.mouse	  = 'a'			-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.clipboard   = 'unnamedplus'	-- Sync clipboard between OS and NeoVim
vim.o.confirm 	  = true		-- raise dialog if performing an operation that would fail due to unsaved changes in the buffer
vim.o.scrolloff   = 10			-- Minimal number of screen lines to keep above and below the cursor.
vim.o.breakindent = true		-- Enable break indent
vim.o.undofile    = true		-- Save undo history
vim.o.ignorecase  = true		-- Enable case-insensitive searching
vim.o.smartcase   = true		-- Allow case-sensitive searching when one or more capital letters are in the search term
vim.o.showmode    = false		-- Don't show the mode 

vim.o.splitright  = false		-- Configure how new splits should be opened
vim.o.splitbelow  = true
vim.o.inccommand  = 'split'		-- Preview substitutions live!

require("lazy").setup("plugins")
