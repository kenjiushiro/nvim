pcall(require, "impatient")
local pack_use = function()
    local use = require("packer").use
    use({ "wbthomason/packer.nvim" })
    use({ "lewis6991/impatient.nvim" })

    ----------------------------------------------------------------------------------------------------------------
    -- Required by others
    ----------------------------------------------------------------------------------------------------------------
    use({ "nvim-lua/plenary.nvim", module = "plenary" })
    use({
        "kyazdani42/nvim-web-devicons",
        module = "nvim-web-devicons",
        config = function()
            require("modules.plugins.dev-icons").config()
        end,
    })

    ----------------------------------------------------------------------------------------------------------------
    -- Completion
    ----------------------------------------------------------------------------------------------------------------
    use({
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        requires = {
            { "hrsh7th/cmp-path", after = "nvim-cmp" },
            { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
            { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
            { "f3fora/cmp-spell", after = "nvim-cmp" },
            { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
        },
        config = function()
            require("modules.plugins.completion").setup()
        end,
    })
    use({
        "windwp/nvim-autopairs",
        after = "nvim-cmp",
        config = function()
            require("modules.plugins.completion").autopairs()
        end,
    })

    use({
        "L3MON4D3/LuaSnip",
        after = "nvim-cmp",
        config = function()
            require("luasnip").config.set_config({
                history = true,
            })
            require("luasnip.loaders.from_vscode").load({})
        end,
    })
    use({ "rafamadriz/friendly-snippets" })

    ----------------------------------------------------------------------------------------------------------------
    -- Navigation
    ----------------------------------------------------------------------------------------------------------------
    use({ "christoomey/vim-tmux-navigator" })
    use({ "psliwka/vim-smoothie" })
    use({
        "phaazon/hop.nvim",
        cmd = { "HopChar2" },
        config = function()
            require("hop").setup()
        end,
    })
    use({
        "rhysd/clever-f.vim",
        keys = { "f", "F", "t", "T" },
        config = function()
            vim.g.clever_f_across_no_line = 1
            vim.cmd("map ; <Plug>(clever-f-repeat-forward)")
            vim.cmd("map , <Plug>(clever-f-repeat-back)")
        end,
    })
    use({
        "kyazdani42/nvim-tree.lua",
        requires = "nvim-web-devicons",
        config = function()
            require("modules.plugins.filetree").config()
        end,
    })
    use({ "ThePrimeagen/harpoon" })

    ----------------------------------------------------------------------------------------------------------------
    -- Editing
    ----------------------------------------------------------------------------------------------------------------
    use({ "kevinhwang91/nvim-bqf", ft = "qf" })
    use({
        "jinh0/eyeliner.nvim",
        config = function()
            require("eyeliner").setup({
                highlight_on_key = true,
                dim = true,
            })
        end,
    })
    use({ "machakann/vim-sandwich", event = "BufRead" })
    use({ "tpope/vim-speeddating" })
    use({ "Konfekt/vim-CtrlXA" })
    use({ "wellle/targets.vim", event = { "BufEnter" } })
    use({ "tommcdo/vim-exchange", keys = { { "n", "cx" }, { "v", "X" } } })
    use({
        "epwalsh/obsidian.nvim",
        tag = "*",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("obsidian").setup({
                workspaces = {
                    {
                        name = "personal",
                        path = "~/vaults/personal",
                    },
                    {
                        name = "work",
                        path = "~/vaults/work",
                    },
                },

                -- see below for full list of options 👇
            })
        end,
    })
    ----------------------------------------------------------------------------------------------------------------
    -- Utils
    ----------------------------------------------------------------------------------------------------------------
    -- use({
    --     "turbio/bracey.vim",
    --     opt = true,
    --     ft = "html",
    --     run = "npm install --prefix server",
    -- })
    -- use({
    --     "iamcco/markdown-preview.nvim",
    --     opt = true,
    --     ft = "markdown",
    --     run = function()
    --         vim.fn["mkdp#util#install"]()
    --     end,
    -- })
    use({
        "rgroli/other.nvim",
        config = function()
            require("other-nvim").setup({
                mappings = {
                    "livewire",
                    "angular",
                    "laravel",
                    "rails",
                    "golang",
                    {
                        pattern = "/path/to/file/src/app/(.*)/.*.ext$",
                        target = "/path/to/file/src/view/%1/",
                        transformer = "lowercase",
                    },
                },
                transformers = {
                    -- defining a custom transformer
                    lowercase = function(inputString)
                        return inputString:lower()
                    end,
                },
                style = {
                    -- How the plugin paints its window borders
                    -- Allowed values are none, single, double, rounded, solid and shadow
                    border = "solid",

                    -- Column seperator for the window
                    seperator = "|",

                    -- width of the window in percent. e.g. 0.5 is 50%, 1.0 is 100%
                    width = 0.7,

                    -- min height in rows.
                    -- when more columns are needed this value is extended automatically
                    minHeight = 2,
                },
            })
        end,
    })
    use({
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        config = "vim.g.undotree_WindowLayout = 2",
    })
    use({ "aquach/vim-http-client" })
    use("vim-test/vim-test")
    use({ "haya14busa/is.vim", keys = { "/", "*", "#" } })
    use({ "haya14busa/vim-asterisk" })
    use({ "michaelb/sniprun", run = "bash ./install.sh" })
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("modules.plugins.treesitter-textobjects").config()
        end,
    })
    use({
        "folke/which-key.nvim",
        event = "BufWinEnter",
        config = function()
            require("modules.plugins.which-key").config()
        end,
    })
    use({
        "mhartington/formatter.nvim",
        cmd = { "Format", "FormatWrite" },
        config = function()
            require("modules.plugins.formatter").config()
        end,
    })

    ----------------------------------------------------------------------------------------------------------------
    -- Telescope
    ----------------------------------------------------------------------------------------------------------------
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
    })
    use("natecraddock/telescope-zf-native.nvim")
    use({
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = function()
            require("modules.plugins.telescope").config()
        end,
    })
    use({
        "ahmedkhalf/project.nvim",
        event = "BufRead",
        ft = "alpha",
        config = function()
            require("project_nvim").setup({
                detection_methods = { "pattern", "lsp" },
                show_hidden = true, -- show hidden files in telescope
            })
        end,
    })

    ----------------------------------------------------------------------------------------------------------------
    -- Treesitter
    ----------------------------------------------------------------------------------------------------------------
    use({
        "nvim-treesitter/playground",
        cmd = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" },
    })
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        event = "BufRead",
        config = function()
            require("modules.plugins.treesitter").config()
        end,
    })

    -----------------------------------------------------------------------------
    -- Git
    -----------------------------------------------------------------------------
    use({
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        requires = "plenary.nvim",
        config = function()
            require("modules.plugins.git").gitsigns()
        end,
    })
    use({
        "TimUntersberger/neogit",
        cmd = "Neogit",
        config = function()
            require("modules.plugins.git").neogit()
        end,
    })
    use({
        "sindrets/diffview.nvim",
        opt = true,
        after = "neogit",
        cmd = "DiffviewOpen",
        config = function()
            require("modules.plugins.git").diffview()
        end,
    })
    use({
        "ruifm/gitlinker.nvim",
        opt = true,
        requires = "plenary.nvim",
        keys = { "<leader>gy" },
        config = function()
            require("modules.plugins.git").gitlinker()
        end,
    })
    use({
        "kdheepak/lazygit.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })
    use({ "tpope/vim-fugitive" })
    use({
        "akinsho/git-conflict.nvim",
        tag = "*",
        config = function()
            require("git-conflict").setup()
        end,
    })
    -----------------------------------------------------------------------------
    -- Debugging
    -----------------------------------------------------------------------------
    -- use { 'jamestthompson3/nvim-remote-containers' }
    -- use {
    --   'https://codeberg.org/esensar/nvim-dev-container',
    --   requires = { 'nvim-treesitter/nvim-treesitter' },
    --   require("devcontainer").setup{
    --       attach_mounts = {
    --       always = true,
    --       neovim_config = {
    --         enabled = true,
    --         options = { "readonly" }
    --       },
    --       neovim_data = {
    --         enabled = true,
    --         options = {}
    --       },
    --     },
    --   }
    -- }
    if pcall(require, "dap") then
        require("modules.plugins.dap").setup()
    end

    use({ "mfussenegger/nvim-dap-python" })

    use({ "leoluz/nvim-dap-go" })

    use({ "blueyed/vim-diminactive" })

    use({ "nvim-neotest/nvim-nio" })

    use({
        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap" },
    })
    use({
        "Pocco81/DAPInstall.nvim",
        requires = { "mfussenegger/nvim-dap" },
    })
    use({
        "theHamsta/nvim-dap-virtual-text",
        requires = { "mfussenegger/nvim-dap" },
    })

    ----------------------------------------------------------------------------------------------------------------
    -- DB
    ----------------------------------------------------------------------------------------------------------------
    use({ "https://github.com/tpope/vim-dadbod" })
    use({ "https://github.com/kristijanhusak/vim-dadbod-ui" })
    use({ "https://github.com/kristijanhusak/vim-dadbod-completion" })

    ----------------------------------------------------------------------------------------------------------------
    -- UI
    ----------------------------------------------------------------------------------------------------------------
    use({
        "nanozuki/tabby.nvim",
        config = function()
            require("modules.plugins.tabby")
        end,
    })
    use("rafamadriz/themes.nvim")
    use("sainnhe/gruvbox-material")
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
        config = function()
            require("modules.plugins.lualine").config()
        end,
    })
    use({
        "goolord/alpha-nvim",
        config = function()
            require("modules.plugins.alpha").config()
        end,
    })
    use({
        "norcalli/nvim-colorizer.lua",
        ft = { "html", "css", "javascript" },
        cmd = { "ColorizerToggle", "ColorizerAttachToBuffer" },
        config = function()
            require("colorizer").setup({ "html", "javascript", "css" }, {
                RRGGBBAA = true,
                rgb_fn = true,
                hsl_fn = true,
                css = true,
                css_fn = true,
            })
        end,
    })
    ----------------------------------------------------------------------------------------------------------------
    -- Lsp
    ----------------------------------------------------------------------------------------------------------------
    use({ "williamboman/mason.nvim" })
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("modules.lsp")
        end,
    })
    use({
        "mfussenegger/nvim-dap",
    })
    use({
        "ray-x/lsp_signature.nvim",
    })
    use({
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            require("mason-nvim-dap").setup()
        end,
    })
    use({
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "html",
                    "tsserver",
                    "cssls",
                    "clangd",
                    "lua_ls",
                    "sqlls",
                },
                require("modules.lsp.servers"),
            })
        end,
    })
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require("lspsaga").setup({})
        end,
    })
end

local fn, execute = vim.fn, vim.api.nvim_command
local install_path = DATA_PATH .. "/site/pack/packer/start/packer.nvim"

local function load_plugins()
    local pack = require("packer")
    pack.init({
        compile_path = install_path .. "/plugin/packer_compiled.lua",
        git = { clone_timeout = 600 },
    })
    pack.startup({
        function()
            pack_use()
        end,
    })
end

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    load_plugins()
    require("packer").sync()
else
    load_plugins()
end
