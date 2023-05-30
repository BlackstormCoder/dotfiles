--------------------
-- Plugins config --
--------------------

-- Bootstrap packer.
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Setup before plugins are loaded.
vim.g.ale_disable_lsp = 1

-- Load different plugins.
return require 'packer'.startup( { function(use)
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 
            {
                'nvim-lua/plenary.nvim', 
                'nvim-lua/popup.nvim',
            }
        }
    }
    use { 
        "catppuccin/nvim", 
        as = "catppuccin" 
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/playground'
        },
        run = ':TSUpdate'
    }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- General UI.
    use 'nvim-tree/nvim-web-devicons' -- A bunch of plugins uses this.
    use 'j-hui/fidget.nvim'
    use 'akinsho/toggleterm.nvim'
    use 'rcarriga/nvim-notify'
    use {
      'nvim-lualine/lualine.nvim',
      requires = {
          'kyazdani42/nvim-web-devicons',
          opt = true
      }
    }
    
    -- use 'glepnir/dashboard-nvim'
    use 'AlexvZyl/dashboard-nvim'
    use {
        'romgrk/barbar.nvim',
        requires = "nvim-tree/nvim-web-devicons",
    }
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }
    use {
        "folke/noice.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify"
        }
    }


    -- Programming experience.
    -- TODO
    use 'lukas-reineke/indent-blankline.nvim'
    use 'mg979/vim-visual-multi'
    use 'RRethy/vim-illuminate'
    use{'numToStr/Comment.nvim'}
    use 'preservim/nerdcommenter'
    use 'tpope/vim-commentary'
    use 'brooth/far.vim'
    use {
        'ggandor/leap.nvim',
        requires = {
            'tpope/vim-repeat'
        }
    }

    -- Git.
    -- TODO
    use 'lewis6991/gitsigns.nvim'
    use 'sindrets/diffview.nvim'
    use 'akinsho/git-conflict.nvim'
    use 'kdheepak/lazygit.nvim'
    use 'ThePrimeagen/git-worktree.nvim'

    -- Neovim helpers.
    use 'folke/which-key.nvim'
    use 'sudormrfbin/cheatsheet.nvim'

    -- Filesystem.
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons'
      },
    }

    -- General language
    use 'neovim/nvim-lspconfig'
    use {
        "glepnir/lspsaga.nvim",
        branch = "main",
    }
    use {
        'L3MON4D3/LuaSnip',
        requires = {
            'saadparwaiz1/cmp_luasnip'
        }
    }

        -- Theme using.
    use {
       'AlexvZyl/nordic.nvim',
       branch = 'main'
    }

    -- List of nice themes:
    --------------------------------------
    use 'bluz71/vim-nightfly-colors'
    use 'morhetz/gruvbox'
    use 'sainnhe/gruvbox-material'
    -- use 'EdenEast/nightfox.nvim'
    use 'folke/tokyonight.nvim'
    use 'sainnhe/everforest'
    use 'sainnhe/edge'
    use 'shaunsingh/nord.nvim'
    use 'dracula/vim'
    use 'joshdick/onedark.vim'
    use 'sam4llis/nvim-tundra'
    use 'rebelot/kanagawa.nvim'
    use 'cocopon/iceberg.vim'
    use 'marko-cerovac/material.nvim'
    use 'sainnhe/sonokai'
    use 'Mofiqul/vscode.nvim'
    ----------------------------------------

    use('ThePrimeagen/vim-be-good')
    
    -- BufferLine
    -- using packer.nvim
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
    use { 'ibhagwan/fzf-lua',
    -- optional for icon support
    requires = { 'nvim-tree/nvim-web-devicons' }
    }
   use {'christoomey/vim-tmux-navigator'}

    
-- Project
-- use { 'nvim-telescope/telescope-project.nvim' }
--   use('roxma/nvim-yarp')
--   use('ncm2/ncm2')   -- Fast python completion (use ncm2 if you want type info or snippet support)
--   use('HansPinckaers/ncm2-jedi')   -- Words in buffer completion
--   use('ncm2/ncm2-bufword')   -- Filepath completion
--   use('ncm2/ncm2-path')

    -- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end

end,

config = {
    display = {
        -- Display packer window as floating.
        open_fn = function ()
            return require 'packer.util'.float { border = 'rounded' }
        end
    }
}

})
