-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	-- Packer can manage itself
	use "wbthomason/packer.nvim"
	use {
		"nvim-telescope/telescope.nvim", tag = "0.1.8",
		-- or                            , branch = "0.1.x",
		requires = { {"nvim-lua/plenary.nvim"} }
	}

	use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})
	use("nvim-treesitter/playground")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")

    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            -- LSP Support
            {"neovim/nvim-lspconfig"},             -- Required
            {"williamboman/mason.nvim"},           -- Optional
            {"williamboman/mason-lspconfig.nvim"}, -- Optional

            -- Autocompletion
            {"hrsh7th/nvim-cmp"},         -- Required
            {"hrsh7th/cmp-nvim-lsp"},     -- Required
            {"hrsh7th/cmp-buffer"},       -- Optional
            {"hrsh7th/cmp-path"},         -- Optional
            {"saadparwaiz1/cmp_luasnip"}, -- Optional
            {"hrsh7th/cmp-nvim-lua"},     -- Optional

            -- Snippets
            {"L3MON4D3/LuaSnip"},             -- Required
            {"rafamadriz/friendly-snippets"}, -- Optional
        }
    }

    use {
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- optional
        },
    }

    -- Faster directory search
    use {
        "cljoly/telescope-repo.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

    -- Indent Style
    use "lukas-reineke/indent-blankline.nvim"

    use "Mofiqul/dracula.nvim"

    use {
      "mfussenegger/nvim-dap",
      requires = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
      },
      config = function()
        require("config.dap") -- we'll create this file next
      end
    }

    use {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup({
                log_level = "info",
                auto_session_enable_last_session = false,
                auto_session_enabled = true,
                auto_save_enabled = true,
                auto_restore_enabled = true,
                auto_session_use_git_branch = false,
                session_lens = {
                    buftypes_to_ignore = {},
                    load_on_setup = false,
                },
                auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
                auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
            })
        end,
    }
end)
