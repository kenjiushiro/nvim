-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.mapleader = " "
-----------------------------------------------------------------------------//
-- Basics {{{1
-----------------------------------------------------------------------------//
vim.keymap.del("n", "<leader>l")
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "0")
vim.keymap.set("v", "L", "$")
vim.keymap.set("v", "H", "0")
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("v", "Y", "<ESC>y$gv")
vim.keymap.set("n", "Q", "<Nop>")
vim.keymap.set("v", "$", "g_")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")
vim.keymap.set("n", "<BS>", "<C-^>")
-- Move selected line / block of text in visual mode
vim.keymap.set("x", "K", ":move '<-2<CR>gv=gv")
vim.keymap.set("x", "J", ":move '>+1<CR>gv=gv")
-- Remap for dealing with word wrap in Normal mode
vim.keymap.set("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true })
vim.keymap.set("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true })
-- same for visual mode
vim.keymap.set("x", "k", '(v:count == 0 && mode() !=# "V") ? "gk" : "k"', { expr = true })
vim.keymap.set("x", "j", '(v:count == 0 && mode() !=# "V") ? "gj" : "j"', { expr = true })
-- Automatically jump to the end of pasted text
vim.keymap.set("v", "y", "y`]")
vim.keymap.set("v", "p", "p`]")
vim.keymap.set("n", "p", "p`]")
-- Select last pasted text
vim.keymap.set("n", "gp", "'`[' . strpart(getregtype(), 0, 1) . '`]'", { expr = true })
-- Beginning and end of line in `:` command mode
vim.keymap.set("c", "<C-a>", "<home>")
vim.keymap.set("c", "<C-e>", "<end>")
-- Keep visual selection when indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
-- Search and replace
vim.keymap.set("n", "c.", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]])
vim.keymap.set("v", "@", "<cmd>norm!@")
-----------------------------------------------------------------------------//
-- File manager {{{1
-----------------------------------------------------------------------------//
vim.keymap.set("n", "<C-b>", "<cmd>Neotree toggle<CR>")
-- change directory to current file
vim.keymap.set(
  "n",
  "cd",
  ":lcd %:p:h<bar>lua print('current directory is ' .. vim.fn.getcwd())<CR>",
  { silent = false }
)
-----------------------------------------------------------------------------//
-- help {{{1
-----------------------------------------------------------------------------//
vim.keymap.set("n", "<leader>hh", "<cmd>Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>hm", "<cmd>Telescope man_pages<CR>")
vim.keymap.set("n", "<leader>ht", "<cmd>Telescope colorscheme<CR>")
vim.keymap.set("n", "<leader>ho", "<cmd>Telescope vim_options<CR>")
-----------------------------------------------------------------------------//
-- buffers {{{1
-----------------------------------------------------------------------------//
vim.keymap.set("n", "<leader>b<C-t>", ":lua require'core.util'.buf_to_tab()<CR>") -- focus in new tab
vim.keymap.set("n", "<leader>bb", "<cmd>Telescope buffers<CR>") -- all buffers
vim.keymap.set("n", "<leader>cp", ':let @+ = expand("%")<CR>') -- copy filepath to clipboard
vim.keymap.set("n", "<leader>w", "<cmd>update<CR>") -- save buffer
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>") -- save buffer
vim.keymap.set("v", "<leader>w", "<ESC>:update<CR>") -- save buffer
vim.keymap.set("n", "<leader>bS", ":silent! wa<CR>") -- save all buffers
vim.keymap.set("n", "<leader>bq", ":lua require'core.util'.delete_buffer()<CR>") -- quit buffer
vim.keymap.set("n", "<leader>bQ", [[<cmd>w <bar> %bd <bar> e#<CR>]]) -- quit all buffers but current
vim.keymap.set("n", "<leader>b%", ":luafile %<CR>", { silent = false }) -- source buffer
vim.keymap.set("n", "<leader>bh", ":noh<CR>") -- No highlight
vim.keymap.set("n", "<leader>b]", ":bn<CR>") -- buffer next
vim.keymap.set("n", "<leader>b[", ":bp<CR>") -- buffer previous
vim.keymap.set("n", "<leader>bn", [[:enew<CR>]], { silent = false }) -- new buffer
vim.keymap.set("n", "<leader>bf", [[:e <C-R>=expand("%:p:h") . "/" <CR>]], { silent = false }) -- new file
vim.keymap.set("n", "<leader>bv", [[:vsp <C-R>=expand("%:p:h") . "/" <CR>]], { silent = false }) -- new split
vim.keymap.set("v", "<leader>on", "<cmd>ObsidianLinkNew<CR>")
vim.keymap.set("v", "<leader>ol", "<cmd>ObsidianLink<CR>")
vim.keymap.set("v", "<leader>oe", "<cmd>ObsidianExtractNote<CR>")
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>")
vim.keymap.set("n", "<leader>fo", "<cmd>ObsidianSearch<CR>")
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTags<CR>")
vim.keymap.set("n", "<leader>oc", "<cmd>ObsidianToggleCheckbox<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")
vim.keymap.set("n", "<leader>hh", "<cmd>lua require('harpoon.mark').add_file()<CR>")
vim.keymap.set("n", "gh", "gT")
vim.keymap.set("n", "gl", "gt")
vim.keymap.set("n", "gj", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>")
vim.keymap.set("n", "gk", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>")
vim.keymap.set("n", "gm", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>")
vim.keymap.set("n", "g,", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>")
vim.keymap.set("n", "g;", "<cmd>lua require('harpoon.ui').nav_file(5)<CR>")
vim.keymap.set("n", "gJ", "<cmd>lua require('harpoon.ui').nav_file(6)<CR>")
vim.keymap.set("n", "gK", "<cmd>lua require('harpoon.ui').nav_file(7)<CR>")
vim.keymap.set("n", "g/", "<cmd>lua require('harpoon.term').gotoTerminal(1)<CR>")
-----------------------------------------------------------------------------//
-- tests {{{1
-----------------------------------------------------------------------------//
vim.keymap.set("n", "<leader>tef", ":TestFile -strategy=neovim<CR>")
vim.keymap.set("n", "<leader>ten", ":TestNearest -strategy=neovim<CR>")
vim.keymap.set("n", "<leader>tel", ":TestLast -strategy=neovim<CR>")
vim.keymap.set("n", "<leader>tev", ":TestVisit<CR>")
vim.keymap.set("n", "<leader>tes", ":TestSuite -strategy=neovim<CR>")
vim.keymap.set("n", "<leader>tep", ":lua require('dap-python').test_class()<CR>")
-----------------------------------------------------------------------------//
-- tabs {{{1
-----------------------------------------------------------------------------//
vim.keymap.set("n", "<leader>tq", [[:tabclose<CR>]], { silent = false }) -- tab close
vim.keymap.set("n", "<leader>t[", [[:tabprevious<CR>]]) -- tab previous
vim.keymap.set("n", "<leader>t]", [[:tabnext<CR>]]) -- tab previous
vim.keymap.set("n", "<leader>tf", [[:tabedit <C-R>=expand("%:p:h") . "/" <CR>]], { silent = false }) -- new file
vim.keymap.set("n", "<leader>tn", [[:tabnew<CR>]], { silent = false }) -- new tab
-----------------------------------------------------------------------------//
-- windows {{{1
-----------------------------------------------------------------------------//
vim.keymap.set("n", "<S-Up>", ":lua require'core.util'.resize(false, -2)<CR>")
vim.keymap.set("n", "<S-Down>", ":lua require'core.util'.resize(false, 2)<CR>")
vim.keymap.set("n", "<S-Left>", ":lua require'core.util'.resize(true, -2)<CR>")
vim.keymap.set("n", "<S-Right>", ":lua require'core.util'.resize(true, 2)<CR>")
vim.keymap.set("n", "<leader>ww", "<C-w>q") -- cycle through window
vim.keymap.set("n", "<leader>wq", "<C-w>q") -- quit window
vim.keymap.set("n", "<leader>ws", "<C-w>s") -- split window
vim.keymap.set("n", "<leader>wv", "<C-w>v") -- vertical split
vim.keymap.set("n", "<leader>wm", "<C-w>|") -- max out to fullscreen
vim.keymap.set("n", "<leader>w=", "<C-w>=") -- equally high and width
vim.keymap.set("n", "<leader>wT", "<C-w>T") -- break out into a new tab
vim.keymap.set("n", "<leader>wr", "<C-w>x") -- replace current with next
vim.keymap.set("n", "<leader>;", "A;<Esc>")
vim.keymap.set("n", "<leader>,", "A,<Esc>")
-----------------------------------------------------------------------------//
-- Quickfix list mappings {{{1
-----------------------------------------------------------------------------//
vim.keymap.set("n", "[q", ":cprevious<CR>zzzv")
vim.keymap.set("n", "]q", ":cnext<CR>zzzv")
vim.keymap.set("n", "[Q", ":cfirst<CR>")
vim.keymap.set("n", "]Q", ":clast<CR>")
vim.keymap.set("n", "[l", ":lprevious<CR>zzzv")
vim.keymap.set("n", "]l", ":lnext<CR>zzzv")
vim.keymap.set("n", "[L", ":lfirst<CR>")
vim.keymap.set("n", "]L", ":llast<CR>")
-----------------------------------------------------------------------------//
-- Git {{{1
-----------------------------------------------------------------------------//
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>") -- Git
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>") -- Git
vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>") -- show diff
vim.keymap.set("n", "<leader>gL", ":Neogit log<CR>") -- log
vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<CR>") -- git branches
vim.keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<CR>") -- git files
vim.keymap.set("n", "<leader>gm", "<cmd>Telescope git_status<CR>") -- git modified files
vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>") -- git commits
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>") -- preview hunk
vim.keymap.set("n", "<leader>gl", ":Gitsigns toggle_current_line_blame<CR>") -- toggle line blame
vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>") -- reset hunk
vim.keymap.set("n", "<leader>gR", ":Gitsigns reset_buffer<CR>") -- reset buffer
vim.keymap.set("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>") -- undo last stage hunk
vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>") -- git stage hunk
vim.keymap.set("n", "<leader>gS", ":Gitsigns stage_buffer<CR>") -- git stage buffer
vim.keymap.set("n", "<leader>g[", ":Gitsigns prev_hunk<CR>") -- previous hunk
vim.keymap.set("n", "<leader>g]", ":Gitsigns next_hunk<CR>") -- next hunk
vim.keymap.set("n", "<leader>gq", ":GitConflictListQf<CR>")
vim.keymap.set("n", "<leader>gt", ":GitConflictChooseTheirs<CR>")
vim.keymap.set("n", "<leader>go", ":GitConflictChooseOurs<CR>")
vim.keymap.set("n", "<leader>gn", ":GitConflictNextConflict<CR>")
vim.keymap.set("n", "<leader>gp", ":GitConflictPrevConflict<CR>")
vim.keymap.set("n", "<leader>ga", ":GitConflictChooseBoth<CR>")
vim.keymap.set("n", "<leader>gx", ":GitConflictChooseNone<CR>")
vim.keymap.set("n", "<leader>gl", ":Gitsigns blame_line<CR>")
-----------------------------------------------------------------------------//
-- Telescope {{{1
-----------------------------------------------------------------------------//
vim.keymap.set("n", "<leader>fR", "<cmd>Telescope registers<CR>")
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope fd cwd=$HOME/requests/<CR>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope fd<CR>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
vim.keymap.set("n", "<leader>fC", "<cmd>Telescope command_history<CR>")
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope commands<CR>")
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope search_history<CR>")
vim.keymap.set("n", "<leader>fq", "<cmd>Telescope quickfix<CR>")
vim.keymap.set("n", "<leader>fl", "<cmd>Telescope loclist<CR>")
vim.keymap.set("n", "<leader>fq", "<cmd>Telescope quickfix<CR>")
vim.keymap.set(
  "n",
  "<leader>fn",
  "<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })<CR>"
)
vim.keymap.set("n", "<leader>fa", ":tabe $HOME/.config/alacritty/alacritty.yml<CR>")
vim.keymap.set("n", "<leader>fp", ":Telescope projects<CR>")
vim.keymap.set("n", "<leader>fm", ":Telescope marks<CR>")
-----------------------------------------------------------------------------//
-- DAP
-----------------------------------------------------------------------------//
vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<leader>dc", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>dl", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", ":DapToggleRepl<CR>")
vim.keymap.set("n", "<leader>da", ":lua require'modules.plugins.dap'.attach()<CR>")
vim.keymap.set("n", "<leader>dt", ":lua require'modules.plugins.dap'.debugJest()<CR>")
vim.keymap.set("n", "<leader>dui", ":lua require'dapui'.toggle()<CR>")
vim.keymap.set("n", "<leader>de", ":lua require'dapui'.eval()<CR>")

vim.keymap.set("n", "<F5>", "<cmd>DapContinue<CR>")
vim.keymap.set("n", "<F6>", "<cmd>DapStepOver<CR>")
vim.keymap.set("n", "<F9>", "<cmd>DapStepInto<CR>")
vim.keymap.set("n", "<F10>", "<cmd>DapStepOut<CR>")
-----------------------------------------------------------------------------//
-- Zen Mode {{{1
-----------------------------------------------------------------------------//
vim.keymap.set("n", "<leader>zf", [[:lua require("modules.plugins.zen").focus()<CR>]])
vim.keymap.set("n", "<leader>zc", [[:lua require("modules.plugins.zen").centered()<CR>]])
vim.keymap.set("n", "<leader>zm", [[:lua require('modules.plugins.zen').minimal()<CR>]])
vim.keymap.set("n", "<leader>za", [[:lua require('modules.plugins.zen').ataraxis()<CR>]])
vim.keymap.set("n", "<leader>zq", ":close<CR>")
-----------------------------------------------------------------------------//
-- Quit/Session {{{1
-----------------------------------------------------------------------------//
-- vim.keymap.set("n", "<leader>qs", ":SSave<CR>")
-- vim.keymap.set("n", "<leader>qq", ":SClose<CR>")
vim.keymap.set("n", "<leader>Q", ":quitall<CR>")
-- vim.keymap.set("n", "<leader>qd", ":SDelete<CR>")
-- vim.keymap.set("n", "<leader>ql", ":SLoad<CR>")
-----------------------------------------------------------------------------//
-- Open/Run {{{1
-----------------------------------------------------------------------------//
vim.keymap.set("n", "<leader>r|", [[:execute "set colorcolumn=" . (&colorcolumn == "0" ? "81" : "")<CR>]])
vim.keymap.set("n", "<leader>rr", "@:<CR>")
vim.keymap.set("n", "<leader>r'", ":Startify<CR>")
vim.keymap.set("n", "<leader>ri", ":IndentBlanklineToggle<CR>")
vim.keymap.set("n", "<leader>rt", ":ToggleTerm<CR>")
vim.keymap.set("n", "<leader>rb", ":Telescope file_browser<CR>")
vim.keymap.set("n", "<leader>r.", ":NvimTreeFindFile<CR>")
vim.keymap.set("n", "<leader>rf", ":Format<CR>")
vim.keymap.set("v", "<leader>f", ":Format<CR>")
vim.keymap.set("n", "<leader>rn", ":vsp ~/.config/nvim/lua/config.lua<CR>")
vim.keymap.set("n", "<leader>rca", ":ColorizerAttachToBuffer<CR>")
vim.keymap.set("n", "<leader>rct", ":ColorizerToggle<CR>")
vim.keymap.set("n", "<leader>rg", ":Gitsigns refresh<CR>")
vim.keymap.set("n", "<leader>rq", ":cwindow<CR>")
vim.keymap.set("n", "<leader>rl", ":lwindow<CR>")
vim.keymap.set("n", "<leader>rJ", [[:<C-u>call append(line("."), repeat([""], v:count1))<CR>]]) -- append line down without insert mode
vim.keymap.set("n", "<leader>rK", [[:<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>]]) -- append line up without insert mode

vim.keymap.set("n", "<leader>sql", ":tabnew<CR>:DBUI<CR>")
vim.keymap.set("n", "<leader>re", ":HTTPClientDoRequest<CR>")
vim.keymap.set("n", "<leader>tt", ":Lspsaga term_toggle<CR>")

vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gD", ":lua vim.lsp.buf.declaration()<CR>")
vim.keymap.set("n", "gy", ":lua vim.lsp.buf.type_definition()<CR>")
vim.keymap.set("n", "gr", ":Lspsaga finder<CR>")
vim.keymap.set("n", "gi", ":lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "<leader>lh", ":lua vim.lsp.buf.signature_help()<CR>")
vim.keymap.set("n", "<leader>lk", ":lua vim.lsp.buf.signature_help()<CR>")
vim.keymap.set("n", "<leader>la", ":Lspsaga code_action<CR>")
vim.keymap.set("n", "<leader>lc", ":lua vim.diagnostic.hide()<CR>")
vim.keymap.set("n", "<leader>lA", ":Telescope lsp_range_code_actions<CR>")
vim.keymap.set("n", "<leader>ld", ":Telescope diagnostics bufnr=0<CR>")
vim.keymap.set("n", "<leader>lD", ":Telescope diagnostics<CR>")
vim.keymap.set("n", "<leader>lr", ":Lspsaga rename<CR>")
vim.keymap.set("n", "<leader>lo", ":Lspsaga outline<CR>")
vim.keymap.set("n", "<leader>ls", ":Telescope lsp_document_symbols<CR>")
vim.keymap.set("n", "<leader>lS", ":Telescope lsp_workspace_symbols<CR>")
vim.keymap.set("n", "<leader>lf", ":lua vim.lsp.buf.formatting()<CR>")
vim.keymap.set("n", "<leader>lp", ":Lspsaga preview_definition<CR>")
vim.keymap.set("n", "<leader>ll", ":Lspsaga show_line_diagnostics<CR>")
vim.keymap.set("n", "<c-p>", ":Lspsaga diagnostic_jump_prev<CR>")
vim.keymap.set("n", "<c-n>", ":Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set("n", "<leader>l,s", [[:LspStop <C-R>=<CR>]], { silent = false })
-- }}}
