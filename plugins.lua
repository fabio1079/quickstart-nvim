return {
  -- Theme
  { "catppuccin/nvim", name = "catppuccin" },

  -- Telescope
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Treesitter (for syntax highlighting)
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- File Tree
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      -- Setup nvim-tree
      require("nvim-tree").setup({
        renderer = {
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
      })
      -- Open NvimTree if Neovim is started without a file
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.argc() == 0 then
            require("nvim-tree.api").tree.open()
          end
        end,
      })
    end,
  },

  -- nvim-web-devicons for Material Icons
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      -- Setup icons
      require("nvim-web-devicons").setup({
        default = true,  -- Use default icons for non-registered filetypes
      })
    end,
  },

  -- Mason (LSP, Formatters, Linters)
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "lua_ls" },
      })
      require("mason-tool-installer").setup({
        ensure_installed = {
          "typescript-language-server",
          "lua-language-server",
          "prettier",
          "stylua",
        },
      })
    end,
  },

  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- TypeScript LSP
      lspconfig.ts_ls.setup({})

      -- Lua LSP
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })
    end,
  },

  -- Formatter Configuration
  {
    "mhartington/formatter.nvim",
    config = function()
      require("formatter").setup({
        filetype = {
          javascript = { require("formatter.filetypes.javascript").prettier },
          typescript = { require("formatter.filetypes.typescript").prettier },
          css = { require("formatter.filetypes.css").prettier },
          html = { require("formatter.filetypes.html").prettier },
          lua = { require("formatter.filetypes.lua").stylua },
          scss = {
            function()
              return {
                exe = "prettier",
                args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
                stdin = true,
              }
            end,
          },
        },
      })
    end,
  },
}

