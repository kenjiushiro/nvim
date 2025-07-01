-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- QOL keymaps
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "0")
vim.keymap.set("v", "L", "$")
vim.keymap.set("v", "H", "0")

vim.keymap.set("n", "Y", "y$")

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")

vim.keymap.set("i", "<C-l>", "=>")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<leader>,", "A,<ESC>")
vim.keymap.set("n", "<leader>;", "A;<ESC>")

vim.keymap.set("x", "K", "<cmd>move '<-2<CR>gv=gv")
vim.keymap.set("x", "J", "<cmd>move '>+1<CR>gv=gv")

vim.keymap.set("c", "<C-a>", "<home>")
vim.keymap.set("c", "<C-e>", "<end>")

vim.keymap.set("n", "c.", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]])
vim.keymap.set("v", "@", "<cmd>norm!@")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")

-- Windows management keymaps
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>bdelete<CR>")
vim.keymap.set("n", "<leader>ws", "<C-w>s")
vim.keymap.set("n", "<leader>wv", "<C-w>v")

vim.keymap.set("n", "<leader>wT", "<C-w>T") -- break out into a new tab
vim.keymap.set("n", "<leader>wm", "<C-w>|") -- max out to fullscreen
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>") -- break out into a new tab
vim.keymap.set("n", "<leader>w=", "<C-w>=") -- equally high and width

-- Tab keymaps
vim.keymap.set("n", "gl", "<cmd>:bnext<CR>")
vim.keymap.set("n", "gh", "<cmd>:bprev<CR>")

vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bprev<CR>")

vim.keymap.set("n", "<BS>", "<cmd>b#<CR>")

-- Clipboard keymaps
vim.keymap.set("n", "y", '"+y')
vim.keymap.set("n", "p", '"+p')
vim.keymap.set("n", "d", '"+d')
vim.keymap.set("n", "c", '"+c')
vim.keymap.set("n", "x", '"+x')

vim.keymap.set("n", "Y", '"+Y')
vim.keymap.set("n", "P", '"+P')
vim.keymap.set("n", "D", '"+D')
vim.keymap.set("n", "C", '"+C')
vim.keymap.set("n", "X", '"+X')

vim.keymap.set("v", "y", '"+y')
vim.keymap.set("v", "p", '"+p')
vim.keymap.set("v", "d", '"+d')
vim.keymap.set("v", "c", '"+c')
vim.keymap.set("v", "x", '"+x')

vim.keymap.set("v", "Y", '"+Y')
vim.keymap.set("v", "P", '"+P')
vim.keymap.set("v", "D", '"+D')
vim.keymap.set("v", "C", '"+C')
vim.keymap.set("v", "X", '"+X')

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)

vim.keymap.set("n", "<C-p>", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<C-n>", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>ll", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>LL", vim.diagnostic.setloclist)

vim.keymap.set("n", "<leader>lS", vim.lsp.buf.workspace_symbol)
vim.keymap.set("n", "<leader>ls", vim.lsp.buf.document_symbol)
