local M = {}
local banners = require'modules.plugins.banners'

M.config = function()
    local alpha = require "alpha"
    local dashboard = require "alpha.themes.dashboard"
    math.randomseed(os.time())
    dashboard.section.header.val = banners[math.random(#banners)]
    dashboard.section.buttons.val = {
      dashboard.button("e", "> 📄 New file", ":enew<CR>"),
      dashboard.button("f", "> 🔎 Find files", ":Telescope fd<CR>"),
      dashboard.button("r", "> 📞 HTTP Client", ":Telescope fd cwd=$HOME/requests/<CR>"),
      dashboard.button("p", "> 💼 Select project", ":Telescope projects<CR>"),
      dashboard.button("n", "> 📝 Nvim Config", ":lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })<CR>"),
      dashboard.button("a", "> 💻 Alacritty config", ":tabe $HOME/.config/alacritty/alacritty.yml<CR>"),
      dashboard.button("s", "> 🔌 Sync plugins", ":PackerSync<CR>"),
      dashboard.button("g", "> 🌿 Git", ":Git<CR>"),
      dashboard.button("q", "> 👋 Quit", ":qa!<CR>"),

    }
    alpha.setup(require("alpha.themes.startify").opts)
    alpha.setup(dashboard.opts)
    local fortune = require("alpha.fortune")
    dashboard.section.footer.val = fortune()
end

return M
