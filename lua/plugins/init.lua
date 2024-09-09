-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>/", false
      },
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
    setup = {
      require("setup.telescope").config(),
    },
  },

  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
      },
    },
  },

  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },

  -- the opts function can also be used to change the default opts:
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, "😄")
    end,
  },

  -- or you can return new options to override all the defaults
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        --[[add your custom lualine config here]]
      }
    end,
  },

  -- use mini.starter instead of alpha
  -- { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "bash-language-server",
        "css-lsp",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "omnisharp",
        "pyright",
        "typescript-language-server",
      },
    },
  },

  { "psliwka/vim-smoothie" },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    config = true,
  },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        disable_netrw = true,
        -- hijack netrw window on startup
        hijack_netrw = true,
        -- closes neovim automatically when the tree is the last **WINDOW** in the view
        -- auto_close = true,
        -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
        open_on_tab = false,
        -- hijacks new directory buffers when they are opened.
        -- update_to_buf_dir = {
        --     -- enable the feature
        --     enable = true,
        --     -- allow to open the tree if it was previously closed
        --     auto_open = true,
        -- },
        -- hijack the cursor in the tree to put it at the start of the filename
        hijack_cursor = true,
        -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
        update_cwd = true,
        -- show lsp diagnostics in the signcolumn
        diagnostics = { enable = true },
        -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
        update_focused_file = {
          -- enables the feature
          enable = true,
          -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
          -- only relevant when `update_focused_file.enable` is true
          update_cwd = false,
          -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
          -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
          ignore_list = {},
        },
        -- configuration options for the system open command (`s` in the tree by default)
        system_open = {
          -- the command to run this, leaving nil should work in most cases
          cmd = nil,
          -- the command arguments as a list
          args = {},
        },

        view = {
          -- width of the window, can be either a number (columns) or a string in `%`
          width = 40,
          -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
          side = vim.g.code_explorer_side or "right",
          -- if true the tree will resize itself after opening a file
          -- auto_resize = false,
        },
      })
    end,
  },
  { "machakann/vim-sandwich", event = "BufRead" },
  { "tpope/vim-speeddating" },
  { "Konfekt/vim-CtrlXA" },
  { "wellle/targets.vim", event = { "BufEnter" } },
  { "tommcdo/vim-exchange", keys = { { "n", "cx" }, { "v", "X" } } },
  {
    "epwalsh/obsidian.nvim",
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
        ui = {
          enable = true, -- set to false to disable all additional syntax features
          update_debounce = 200, -- update delay after a text change (in milliseconds)
          max_file_length = 5000, -- disable UI features for files with more than this many lines
          -- Define how various check-boxes are displayed
          checkboxes = {
            -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
            -- [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
            ["x"] = { char = "", hl_group = "ObsidianDone", order = 1 },
            [">"] = { char = "", hl_group = "ObsidianRightArrow", order = 2 },
            ["~"] = { char = "󰰱", hl_group = "ObsidianTilde", order = 3 },
            ["?"] = { char = "", hl_group = "ObsidianBullet", order = 4 },
            ["!"] = { char = "", hl_group = "ObsidianImportant", order = 5 },
            -- Replace the above with this if you don't have a patched font:
            [" "] = { char = "", hl_group = "White", order = 6 },

            -- You can also add more custom ones...
          },
          -- Use bullet marks for non-checkbox lists.
          bullets = { char = "•", hl_group = "ObsidianBullet" },
          external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
          -- Replace the above with this if you don't have a patched font:
          -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
          reference_text = { hl_group = "ObsidianRefText" },
          highlight_text = { hl_group = "ObsidianHighlightText" },
          tags = { hl_group = "ObsidianTag" },
          block_ids = { hl_group = "ObsidianBlockID" },
          hl_groups = {
            -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
            ObsidianTodo = { bold = true, fg = "#f78c6c" },
            ObsidianDone = { bold = true, fg = "#89ddff" },
            ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
            ObsidianTilde = { bold = true, fg = "#ff5370" }, -- red
            ObsidianImportant = { bold = true, fg = "#d73128" },
            ObsidianBullet = { bold = true, fg = "#89ddff" },
            ObsidianRefText = { underline = true, fg = "#c792ea" },
            ObsidianExtLinkIcon = { fg = "#c792ea" },
            ObsidianTag = { italic = true, fg = "#89ddff" },
            ObsidianBlockID = { italic = true, fg = "#89ddff" },
            ObsidianHighlightText = { bg = "#75662e" },
            White = { bg = "#000000" },
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ai"] = "@conditional.outer",
              ["ii"] = "@conditional.inner",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
              -- You can optionally set descriptions to the mappings (used in the desc parameter of
              -- nvim_buf_set_keymap) which plugins like which-key display
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              -- You can also use captures from other query groups like `locals.scm`
              ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
              ["@parameter.outer"] = "v", -- charwise
              ["@function.outer"] = "V", -- linewise
              ["@class.outer"] = "<c-v>", -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true of false
            include_surrounding_whitespace = false,
          },
        },
      })
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  { "ThePrimeagen/harpoon" },
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("setup.alpha").config()
    end,
  },
  {
    "nanozuki/tabby.nvim",
    config = function()
      require("setup.tabby")
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").setup({})
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
  },
  {
    "Pocco81/DAPInstall.nvim",
    requires = { "mfussenegger/nvim-dap" },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    requires = { "mfussenegger/nvim-dap" },
  },

  { "tpope/vim-dadbod" },
  { "kristijanhusak/vim-dadbod-ui" },
  { "kristijanhusak/vim-dadbod-completion" },

  { "vim-test/vim-test" },

  { "kevinhwang91/nvim-bqf", ft = "qf" },

  { "tommcdo/vim-exchange", keys = { { "n", "cx" }, { "v", "X" } } },

  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>e",
        false,
      },
    },
    opts = {
      window = { position = "right" },
    },
  },
}
