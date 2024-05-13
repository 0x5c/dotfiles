local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(
    {
        {
            'uloco/bluloco.nvim',
            lazy = false,
            priority = 1000,
            dependencies = { 'rktjmp/lush.nvim' },
            opts = require('cfg.bluloco'),
        },
        {
            'nvim-tree/nvim-web-devicons',
            config = true
        },
        {
            'nvim-lualine/lualine.nvim',
            dependencies = 'nvim-tree/nvim-web-devicons',
            opts = require('cfg.lualine'),
        },
        {
            'mfussenegger/nvim-lint',
            config = require('cfg.lint')
        },
        {
            'lewis6991/gitsigns.nvim',
            dependencies = 'nvim-lua/plenary.nvim',
            opts = require('cfg.gitsigns'),
        },
        {
            'nvim-tree/nvim-tree.lua',
            dependencies = 'nvim-tree/nvim-web-devicons',
            lazy = false,
            config = require('cfg.tree'),
        },
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            config = true
        },
        {
            'numToStr/Comment.nvim',
            lazy = false,
            config = true,
        },
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = require('cfg.treesitter'),
        },
    },
    {  -- Lazy options
        install = {
            missing = false
        }
    }
)
