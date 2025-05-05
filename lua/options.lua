vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.expandtab = true     -- Use spaces instead of tabs
vim.opt.shiftwidth = 2       -- Indent size when shifting (with >> or <<)
vim.opt.tabstop = 2          -- Number of spaces a tab counts for
vim.opt.softtabstop = 2      -- Number of spaces when pressing Tab

vim.g.netrw_winsize = 25


-- Netrw settings
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_liststyle = 3
vim.g.netrw_altv = 1  

-- Open netrw on the right side
vim.keymap.set("n", "<leader>e", function()
  vim.cmd("Vexplore")
  vim.cmd("wincmd L")
end, { desc = "Open netrw on the right" })

-- Custom keymaps for netrw (h/l navigation)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    local opts = { buffer = true, silent = true }
  end,
})
