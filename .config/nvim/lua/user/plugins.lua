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
	use { "nvim-lua/plenary.nvim",
		  commit = "1c7e3e6b0f4dd5a174fcea9fda8a4d7de593b826"
		}

	-- Autopairs
	use { "windwp/nvim-autopairs",
		  commit = "f00eb3b766c370cb34fdabc29c760338ba9e4c6c"
	  	}

	-- Comments
	use { "numToStr/Comment.nvim",
		  commit = "eab2c83a0207369900e92783f56990808082eac2"
	  	}

	-- Some shiny icons
	use { "kyazdani42/nvim-web-devicons",
		  commit = "6c38926351372ea87034dec26182b62c835ff3bc"
	  	}

	-- tree-view
	use { "kyazdani42/nvim-tree.lua",
		  commit = "e8a89db1bbc06510a76fc935754b4e99a3e5e8a7"
	  	}

	-- sane alternative to bdelete
	use { "moll/vim-bbye",
		  commit = "25ef93ac5a87526111f43e5110675032dbcacf56"
	  	}

	-- airline but better. TODO: setup
	use { "nvim-lualine/lualine.nvim",
		  commit = "0050b308552e45f7128f399886c86afefc3eb988"
	  	}

	-- indentation lines
	-- use { "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" }

    -- hints about possible combinations
    -- use { "folke/which-key.nvim" }

	-- Completions (TODO: do I need this pack?)
	-- The completion plugin
	use { "hrsh7th/nvim-cmp",
		  commit = "11a95792a5be0f5a40bab5fc5b670e5b1399a939"
	  	}

	-- buffer completions
	use { "hrsh7th/cmp-buffer",
		  commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa"
	  	}

	-- path completions
	use { "hrsh7th/cmp-path",
		  commit = "91ff86cd9c29299a64f968ebb45846c485725f23"
	  	}

	-- snippet completions
	use { "saadparwaiz1/cmp_luasnip",
		  commit = "18095520391186d634a0045dacaa346291096566"
	  	}

	use { "hrsh7th/cmp-nvim-lsp",
		  commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb"
	  	}

	use { "hrsh7th/cmp-nvim-lua",
		  commit = "f3491638d123cfd2c8048aefaf66d246ff250ca6"
	  	}
	-- endof: Completions

	-- Snippets
	-- It seems cmp needs that
	-- snippet engine
	use { "L3MON4D3/LuaSnip",
		  commit = "af60ac12fa1349dbad479fc1e95d5aea977c0c37"
	  	}
  -- a bunch of snippets to use
  -- use { "rafamadriz/friendly-snippets",
  --       commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" }

	-- LSP
	-- enable LSP
	use { "neovim/nvim-lspconfig",
		  commit = "d228bcf7cd94611929482a09e114a42c41fe81a8"
	  	}

	-- simple to use language server installer
	use { "williamboman/mason.nvim",
          commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12"
      	}

	use { "williamboman/mason-lspconfig.nvim",
          commit = "0051870dd728f4988110a1b2d47f4a4510213e31"
      	}

	-- for formatters and linters
	use { "jose-elias-alvarez/null-ls.nvim",
		  commit = "ef3d4a438f96865e3ae018e33ed30156a955ed00"
	  	}

	use { "RRethy/vim-illuminate",
		  commit = "da80f3877896adcf77f59fb0bf74e9601615d372"
	  	}

	-- Telescope
	use { "nvim-telescope/telescope.nvim",
		  commit = "2f32775405f6706348b71d0bb8a15a22852a61e4"
	  	}

	-- tree-sitter
	use { "nvim-treesitter/nvim-treesitter",
		  commit = "c9615952e71397cec4cf89a9a0db0fb9c491a5e1"
	  	}

	use { "nvim-treesitter/playground",
		  commit = "01c27f37a1f067200680cacfb7b96f5ad2fa5cd6"
	  	}

	-- Additional text objects via treesitter
	use { "nvim-treesitter/nvim-treesitter-textobjects",
		  commit = "2fb97bd6c53d78517d2022a0b84422c18ce5686e",
		  after = "nvim-treesitter",
    	}

	-- Substitute for OrgMode
	use { "nvim-neorg/neorg",
          tag = "*"
    	}

	--- OrgMode
	use { "nvim-orgmode/orgmode",
		  commit = "dadf56334d2be7d9e8ad1e22c697a6e75f0164b7"
	  	}

	use { "Sinamore/monokai.nvim",
          branch = "sinamore-home-rules"
    	}

	-- this should be in the end
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
