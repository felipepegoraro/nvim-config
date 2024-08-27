return {
    -- basic
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-ui-select.nvim'
        }
    },
    { 'nvim-treesitter/nvim-treesitter', build=':TSUpdate' },
    { 'nvim-neo-tree/neo-tree.nvim', branch = 'v3.x',
        dependencies = {
          'nvim-lua/plenary.nvim',
          'nvim-tree/nvim-web-devicons',
          'MunifTanjim/nui.nvim',
        }
    },
    { 'nvim-lualine/lualine.nvim' },

    -- helpers
    { 'lukas-reineke/indent-blankline.nvim' },
    { 'folke/which-key.nvim', setup = {keys = { "<leader>", '"', "'", "`" }} },
    { 'numToStr/Comment.nvim' },
    { 'tell-k/vim-autopep8' },

    -- themes
    { 'hachy/eva01.vim' },
    { 'tiagovla/tokyodark.nvim' },
    { 'catppuccin/nvim', name='catppuccin', priority=1000 }
}

--return {
--  ["vim-skk/eskk.vim"]             = {},
--  ["tpope/vim-surround"]           = {},
--  ["tell-k/vim-autopep8"]          = {},
--  ["sindrets/diffview.nvim"]       = {},
--  ["terryma/vim-multiple-cursors"] = {},
--  ["jbyuki/nabla.nvim"]            = {},
--  ["junegunn/vim-easy-align"]      = {},
--  ["kwakzalver/duckytype.nvim"]    = {},
--  ["vim-scripts/renamer.vim"]      = {}, -- vim +Renamer
--
--  ["kevinhwang91/nvim-bqf"]        = {
--    ft = 'qf'
--  },
--
--  ["goolord/alpha-nvim"]           = {
--    disable = false,
--  }
--}
--
-- ["roobert/tailwindcss-colorizer-cmp.nvim"] = {},
