return {
	-- Theme
	{ "catppuccin/nvim", name = "catppuccin", lazy = false },

	-- Telescope
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

	-- Treesitter (for syntax highlighting)
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- File Tree
	{ "nvim-tree/nvim-tree.lua" },

	-- nvim-web-devicons for Material Icons
	{ "nvim-tree/nvim-web-devicons" },

	{ -- Statusline
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Mason (LSP, Formatters, Linters)
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
	},

	-- LSP Configuration
	{ "neovim/nvim-lspconfig" },

	{ "stevearc/conform.nvim" },

	{ -- Indentation guides
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
}
