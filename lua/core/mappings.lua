-----------------------------------------------------------------------------//
--[[ NOTE:
In telescope use <C-q> to send all results to quickfix and <M-q> or
<A-q> to send selected items

 You can use a regex pattern as part of a range in command mode, E.g.
 :3,/stop/s/hello/world/g ]]

-- TODO: Refactor whenever https://github.com/neovim/neovim/pull/13823 gets merged
-----------------------------------------------------------------------------//
vim.g.mapleader = " "
-----------------------------------------------------------------------------//
-- Basics {{{1
-----------------------------------------------------------------------------//
as.map("n", "L", "$")
as.map("n", "H", "0")
as.map("v", "L", "$")
as.map("v", "H", "0")
as.map("n", "Y", "y$")
as.map("v", "Y", "<ESC>y$gv")
as.map("n", "Q", "<Nop>")
as.map("v", "$", "g_")
as.map("n", "n", "nzzzv")
as.map("n", "N", "Nzzzv")
as.map("n", "J", "mzJ`z")
as.map("i", "jk", "<ESC>")
as.map("i", "kj", "<ESC>")
as.map("n", "<BS>", "<C-^>")
-- Move selected line / block of text in visual mode
as.map("x", "K", ":move '<-2<CR>gv=gv")
as.map("x", "J", ":move '>+1<CR>gv=gv")
-- Remap for dealing with word wrap in Normal mode
as.map("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true })
as.map("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true })
-- same for visual mode
as.map("x", "k", '(v:count == 0 && mode() !=# "V") ? "gk" : "k"', { expr = true })
as.map("x", "j", '(v:count == 0 && mode() !=# "V") ? "gj" : "j"', { expr = true })
-- Automatically jump to the end of pasted text
as.map("v", "y", "y`]")
as.map("v", "p", "p`]")
as.map("n", "p", "p`]")
-- Select last pasted text
as.map("n", "gp", "'`[' . strpart(getregtype(), 0, 1) . '`]'", { expr = true })
-- Beginning and end of line in `:` command mode
as.map("c", "<C-a>", "<home>")
as.map("c", "<C-e>", "<end>")
-- Keep visual selection when indenting
as.map("v", "<", "<gv")
as.map("v", ">", ">gv")
-- Search and replace
as.map("n", "c.", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]])
as.map("v", "@", ":norm!@")
-----------------------------------------------------------------------------//
-- File manager {{{1
-----------------------------------------------------------------------------//
as.map("n", "<C-b>", ":NvimTreeToggle<CR>")
-- change directory to current file
as.map("n", "cd", ":lcd %:p:h<bar>lua print('current directory is ' .. vim.fn.getcwd())<CR>", { silent = false })
-----------------------------------------------------------------------------//
-- help {{{1
-----------------------------------------------------------------------------//
as.map("n", "<leader>hh", ":Telescope help_tags<CR>")
as.map("n", "<leader>hm", ":Telescope man_pages<CR>")
as.map("n", "<leader>ht", ":Telescope colorscheme<CR>")
as.map("n", "<leader>ho", ":Telescope vim_options<CR>")
as.map("n", "<leader>hpi", ":PackerInstall<CR>")
as.map("n", "<leader>hpu", ":PackerUpdate<CR>")
as.map("n", "<leader>hps", ":PackerStatus<CR>")
as.map("n", "<leader>hpS", ":PackerSync<CR>")
as.map("n", "<leader>hpc", ":PackerCompile<CR>")
as.map("n", "<leader>hpC", ":PackerClean<CR>")
as.map("n", "<leader>hph", ":help packer.txt<CR>")
-----------------------------------------------------------------------------//
-- buffers {{{1
-----------------------------------------------------------------------------//
as.map("n", "<leader>b<C-t>", ":lua require'core.util'.buf_to_tab()<CR>") -- focus in new tab
as.map("n", "<leader>bb", ":Telescope buffers<CR>") -- all buffers
as.map("n", "<leader>cp", ':let @+ = expand("%")<CR>') -- copy filepath to clipboard
as.map("n", "<leader>w", ":update<CR>") -- save buffer
as.map("n", "<leader>q", ":q<CR>") -- save buffer
as.map("v", "<leader>w", "<ESC>:update<CR>") -- save buffer
as.map("n", "<leader>bS", ":silent! wa<CR>") -- save all buffers
as.map("n", "<leader>bq", ":lua require'core.util'.delete_buffer()<CR>") -- quit buffer
as.map("n", "<leader>bQ", [[<cmd>w <bar> %bd <bar> e#<CR>]]) -- quit all buffers but current
as.map("n", "<leader>b%", ":luafile %<CR>", { silent = false }) -- source buffer
as.map("n", "<leader>bh", ":noh<CR>") -- No highlight
as.map("n", "<leader>b]", ":bn<CR>") -- buffer next
as.map("n", "<leader>b[", ":bp<CR>") -- buffer previous
as.map("n", "<leader>bn", [[:enew<CR>]], { silent = false }) -- new buffer
as.map("n", "<leader>bf", [[:e <C-R>=expand("%:p:h") . "/" <CR>]], { silent = false }) -- new file
as.map("n", "<leader>bv", [[:vsp <C-R>=expand("%:p:h") . "/" <CR>]], { silent = false }) -- new split
as.map("n", "<leader>s", ":HopChar2<CR>")
as.map("n", "<leader>S", ":HopChar1<CR>")
as.map("n", "<leader>o", ":Other<CR>")
as.map("n", "<leader>h", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
as.map("n", "<leader>hh", ":lua require('harpoon.mark').add_file()<CR>")
as.map("n", "gh", "gT")
as.map("n", "gl", "gt")
as.map("n", "gj", ":lua require('harpoon.ui').nav_file(1)<CR>")
as.map("n", "gk", ":lua require('harpoon.ui').nav_file(2)<CR>")
as.map("n", "gm", ":lua require('harpoon.ui').nav_file(3)<CR>")
as.map("n", "g,", ":lua require('harpoon.ui').nav_file(4)<CR>")
as.map("n", "gp", ":lua require('harpoon.ui').nav_prev()<CR>")
as.map("n", "gn", ":lua require('harpoon.ui').nav_next()<CR>")
-----------------------------------------------------------------------------//
-- tests {{{1
-----------------------------------------------------------------------------//
as.map("n", "<leader>tef", ":TestFile -strategy=neovim<CR>")
as.map("n", "<leader>ten", ":TestNearest -strategy=neovim<CR>")
as.map("n", "<leader>tel", ":TestLast -strategy=neovim<CR>")
as.map("n", "<leader>tev", ":TestVisit<CR>")
as.map("n", "<leader>tes", ":TestSuite -strategy=neovim<CR>")
as.map("n", "<leader>tep", ":lua require('dap-python').test_class()<CR>")
-----------------------------------------------------------------------------//
-- tabs {{{1
-----------------------------------------------------------------------------//
as.map("n", "<leader>tq", [[:tabclose<CR>]], { silent = false }) -- tab close
as.map("n", "<leader>t[", [[:tabprevious<CR>]]) -- tab previous
as.map("n", "<leader>t]", [[:tabnext<CR>]]) -- tab previous
as.map("n", "<leader>tf", [[:tabedit <C-R>=expand("%:p:h") . "/" <CR>]], { silent = false }) -- new file
as.map("n", "<leader>tn", [[:tabnew<CR>]], { silent = false }) -- new tab
-----------------------------------------------------------------------------//
-- windows {{{1
-----------------------------------------------------------------------------//
as.map("n", "<S-Up>", ":lua require'core.util'.resize(false, -2)<CR>")
as.map("n", "<S-Down>", ":lua require'core.util'.resize(false, 2)<CR>")
as.map("n", "<S-Left>", ":lua require'core.util'.resize(true, -2)<CR>")
as.map("n", "<S-Right>", ":lua require'core.util'.resize(true, 2)<CR>")
as.map("n", "<leader>ww", "<C-w>q") -- cycle through window
as.map("n", "<leader>wq", "<C-w>q") -- quit window
as.map("n", "<leader>ws", "<C-w>s") -- split window
as.map("n", "<leader>wv", "<C-w>v") -- vertical split
as.map("n", "<leader>wm", "<C-w>|") -- max out to fullscreen
as.map("n", "<leader>w=", "<C-w>=") -- equally high and width
as.map("n", "<leader>wT", "<C-w>T") -- break out into a new tab
as.map("n", "<leader>wr", "<C-w>x") -- replace current with next
as.map("n", "<leader>;", "A;<Esc>")
as.map("n", "<leader>,", "A,<Esc>")
-----------------------------------------------------------------------------//
-- Quickfix list mappings {{{1
-----------------------------------------------------------------------------//
as.map("n", "[q", ":cprevious<CR>zzzv")
as.map("n", "]q", ":cnext<CR>zzzv")
as.map("n", "[Q", ":cfirst<CR>")
as.map("n", "]Q", ":clast<CR>")
as.map("n", "[l", ":lprevious<CR>zzzv")
as.map("n", "]l", ":lnext<CR>zzzv")
as.map("n", "[L", ":lfirst<CR>")
as.map("n", "]L", ":llast<CR>")
-----------------------------------------------------------------------------//
-- Git {{{1
-----------------------------------------------------------------------------//
as.map("n", "<leader>gg", ":Neogit<CR>") -- Git
as.map("n", "<leader>lg", ":LazyGit<CR>") -- Git
as.map("n", "<leader>gd", ":DiffviewOpen<CR>") -- show diff
as.map("n", "<leader>gL", ":Neogit log<CR>") -- log
as.map("n", "<leader>gb", ":Telescope git_branches<CR>") -- git branches
as.map("n", "<leader>gf", ":Telescope git_files<CR>") -- git files
as.map("n", "<leader>gm", ":Telescope git_status<CR>") -- git modified files
as.map("n", "<leader>gc", ":Telescope git_commits<CR>") -- git commits
as.map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>") -- preview hunk
as.map("n", "<leader>gl", ":Gitsigns toggle_current_line_blame<CR>") -- toggle line blame
as.map("n", "<leader>gr", ":Gitsigns reset_hunk<CR>") -- reset hunk
as.map("n", "<leader>gR", ":Gitsigns reset_buffer<CR>") -- reset buffer
as.map("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>") -- undo last stage hunk
as.map("n", "<leader>gs", ":Gitsigns stage_hunk<CR>") -- git stage hunk
as.map("n", "<leader>gS", ":Gitsigns stage_buffer<CR>") -- git stage buffer
as.map("n", "<leader>g[", ":Gitsigns prev_hunk<CR>") -- previous hunk
as.map("n", "<leader>g]", ":Gitsigns next_hunk<CR>") -- next hunk
as.map("n", "<leader>gq", ":GitConflictListQf<CR>")
as.map("n", "<leader>gt", ":GitConflictChooseTheirs<CR>")
as.map("n", "<leader>go", ":GitConflictChooseOurs<CR>")
as.map("n", "<leader>gn", ":GitConflictNextConflict<CR>")
as.map("n", "<leader>gp", ":GitConflictPrevConflict<CR>")
as.map("n", "<leader>ga", ":GitConflictChooseBoth<CR>")
as.map("n", "<leader>gx", ":GitConflictChooseNone<CR>")
as.map("n", "<leader>gl", ":Gitsigns blame_line<CR>")
-----------------------------------------------------------------------------//
-- Telescope {{{1
-----------------------------------------------------------------------------//
as.map("n", "<leader>fR", ":Telescope registers<CR>")
as.map("n", "<leader>fr", ":Telescope fd cwd=$HOME/requests/<CR>")
as.map("n", "<leader>fg", ":Telescope live_grep<CR>")
as.map("n", "<leader>ff", ":Telescope fd<CR>")
as.map("n", "<leader>fb", ":Telescope current_buffer_fuzzy_find<CR>")
as.map("n", "<leader>fC", ":Telescope command_history<CR>")
as.map("n", "<leader>fc", ":Telescope commands<CR>")
as.map("n", "<leader>fs", ":Telescope search_history<CR>")
as.map("n", "<leader>fq", ":Telescope quickfix<CR>")
as.map("n", "<leader>fl", ":Telescope loclist<CR>")
as.map("n", "<leader>fq", ":Telescope quickfix<CR>")
as.map("n", "<leader>fn", ":lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })<CR>")
as.map("n", "<leader>fa", ":tabe $HOME/.config/alacritty/alacritty.yml<CR>")
as.map("n", "<leader>fp", ":Telescope projects<CR>")
as.map("n", "<leader>fm", ":Telescope marks<CR>")
-----------------------------------------------------------------------------//
-- DAP
-----------------------------------------------------------------------------//
as.map("n", "<leader>db", ":DapToggleBreakpoint<CR>")
as.map("n", "<leader>dc", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
as.map("n", "<leader>dl", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
as.map("n", "<leader>dr", ":DapToggleRepl<CR>")
as.map("n", "<leader>da", ":lua require'modules.plugins.dap'.attach()<CR>")
as.map("n", "<leader>dt", ":lua require'modules.plugins.dap'.debugJest()<CR>")
as.map("n", "<leader>dui", ":lua require'dapui'.toggle()<CR>")
as.map("n", "<leader>de", ":lua require'dapui'.eval()<CR>")

as.map("n", "<F5>", ":DapContinue<CR>")
as.map("n", "<F6>", ":DapStepOver<CR>")
as.map("n", "<F9>", ":DapStepInto<CR>")
as.map("n", "<F10>", ":DapStepOut<CR>")
-----------------------------------------------------------------------------//
-- Zen Mode {{{1
-----------------------------------------------------------------------------//
as.map("n", "<leader>zf", [[:lua require("modules.plugins.zen").focus()<CR>]])
as.map("n", "<leader>zc", [[:lua require("modules.plugins.zen").centered()<CR>]])
as.map("n", "<leader>zm", [[:lua require('modules.plugins.zen').minimal()<CR>]])
as.map("n", "<leader>za", [[:lua require('modules.plugins.zen').ataraxis()<CR>]])
as.map("n", "<leader>zq", ":close<CR>")
-----------------------------------------------------------------------------//
-- Quit/Session {{{1
-----------------------------------------------------------------------------//
-- as.map("n", "<leader>qs", ":SSave<CR>")
-- as.map("n", "<leader>qq", ":SClose<CR>")
as.map("n", "<leader>Q", ":quitall<CR>")
-- as.map("n", "<leader>qd", ":SDelete<CR>")
-- as.map("n", "<leader>ql", ":SLoad<CR>")
-----------------------------------------------------------------------------//
-- Open/Run {{{1
-----------------------------------------------------------------------------//
as.map("n", "<leader>r|", [[:execute "set colorcolumn=" . (&colorcolumn == "0" ? "81" : "")<CR>]])
as.map("n", "<leader>rr", "@:<CR>")
as.map("n", "<leader>r'", ":Startify<CR>")
as.map("n", "<leader>ri", ":IndentBlanklineToggle<CR>")
as.map("n", "<leader>rt", ":ToggleTerm<CR>")
as.map("n", "<leader>rb", ":Telescope file_browser<CR>")
as.map("n", "<leader>r.", ":NvimTreeFindFile<CR>")
as.map("n", "<leader>rf", ":Format<CR>")
as.map("v", "<leader>f", ":Format<CR>")
as.map("n", "<leader>rn", ":vsp ~/.config/nvim/lua/config.lua<CR>")
as.map("n", "<leader>rca", ":ColorizerAttachToBuffer<CR>")
as.map("n", "<leader>rct", ":ColorizerToggle<CR>")
as.map("n", "<leader>rg", ":Gitsigns refresh<CR>")
as.map("n", "<leader>rq", ":cwindow<CR>")
as.map("n", "<leader>rl", ":lwindow<CR>")
as.map("n", "<leader>rJ", [[:<C-u>call append(line("."), repeat([""], v:count1))<CR>]]) -- append line down without insert mode
as.map("n", "<leader>rK", [[:<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>]]) -- append line up without insert mode

as.map("n", "<leader>sql", ":tabnew<CR>:DBUI<CR>")
as.map("n", "<leader>re", ":HTTPClientDoRequest<CR>")
as.map("n", "<leader>tt", ":Lspsaga term_toggle<CR>")
-- }}}
