-- copied from LunarVim/Neovim-from-scratch

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

	 -- Have packer manage itself
	use { "wbthomason/packer.nvim",
        commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422"
      }

	-- Set of lua functions for other plugins
	use { "nvim-lua/plenary.nvim" }

	-- Autopairs
	use { "windwp/nvim-autopairs" }

	-- Comments
	use { "numToStr/Comment.nvim" }

	-- Some shiny icons
	use { "kyazdani42/nvim-web-devicons" }

	-- tree-view
	use { "kyazdani42/nvim-tree.lua" }

	-- sane alternative to bdelete
	use { "moll/vim-bbye" }

	-- airline but better. TODO: setup
	use { "nvim-lualine/lualine.nvim" }

	-- indentation lines
	-- use { "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" }

    -- hints about possible combinations
    -- use { "folke/which-key.nvim" }

	-- Completions (TODO: do I need this pack?)
	-- The completion plugin
	use { "hrsh7th/nvim-cmp" }

	-- buffer completions
	use { "hrsh7th/cmp-buffer" }

  -- path completions
	use { "hrsh7th/cmp-path" }
	-- snippet completions
  use { "saadparwaiz1/cmp_luasnip" }

  use { "hrsh7th/cmp-nvim-lsp" }

  use { "hrsh7th/cmp-nvim-lua" }
  -- endof: Completions

	-- Snippets
  -- It seems cmp needs that
  -- snippet engine
  use { "L3MON4D3/LuaSnip" }
  -- a bunch of snippets to use
  -- use { "rafamadriz/friendly-snippets",
  --       commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" }

  -- LSP
  -- enable LSP
	use { "neovim/nvim-lspconfig" }

  -- simple to use language server installer
  use { "williamboman/mason.nvim",
        commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12"
      }

  use { "williamboman/mason-lspconfig.nvim",
        commit = "0051870dd728f4988110a1b2d47f4a4510213e31"
      }

  -- for formatters and linters
	use { "jose-elias-alvarez/null-ls.nvim" }

  use { "RRethy/vim-illuminate" }

	-- Telescope
	use { "nvim-telescope/telescope.nvim" }

	-- tree-sitter
	use { "nvim-treesitter/nvim-treesitter" }

	use { "nvim-treesitter/playground" }

  -- Additional text objects via treesitter
  use { "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
      }

  -- Substitute for OrgMode
  use { "nvim-neorg/neorg",
        tag = "*"
      }

  --- OrgMode
  use { "nvim-orgmode/orgmode" }

  use { "Sinamore/monokai.nvim",
        branch = "sinamore-home-rules"
      }

	-- this should be in the end
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
