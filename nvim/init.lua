vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.timeout = false
vim.opt.ttimeout = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.autoread = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
-- vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 10
vim.opt.ignorecase = true
vim.opt.breakindent = true
vim.opt.wrap = true
vim.opt.mouse = a
vim.opt.fixeol = false
vim.opt.backspace = [[indent,eol,start]]
vim.opt.termguicolors = true
vim.opt.path:append '**'
vim.opt.autowrite = true
vim.opt.hidden = true
vim.opt.wildmenu = true
vim.opt.wildoptions = 'pum'
vim.opt.undofile = true
vim.opt.termguicolors = true
-- vim.opt.guicursor = [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175]]
vim.opt.mouse = 'a'

-- [[ Keymaps ]]

-- Navigate tabs
vim.keymap.set('n', '<C-h>', 'gT')
vim.keymap.set('n', '<C-l>', 'gt')

-- Move text
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

-- Replace selection without yank
vim.keymap.set('x', '<leader>r', '"_dP')

-- Shortcuts for copy/paste clipboard
vim.keymap.set('', '<leader>y', '"+y')
vim.keymap.set('', '<leader>Y', '"+Y')
vim.keymap.set('', '<leader>p', '"+p')
vim.keymap.set('', '<leader>P', '"+P')

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.filetype.add({extension = {vs = "glsl", fs = "glsl"}})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end 
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { -- gc to comment out code
        'numToStr/Comment.nvim', 
        opts = {} 
    },

    { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        opts = {
            ensure_installed = { 'bash', 'c', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'glsl'},
            auto_install = true,
            highlight = {
                enable = true,
                -- disable = true,
            },
            indent = { 
                enable = true, 
            },
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end,
    },

    { -- Telescope
        'nvim-telescope/telescope.nvim', 
        event = 'VimEnter',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require 'telescope.builtin'
            vim.keymap.set('n', '<leader>ff', builtin.find_files)
            vim.keymap.set('n', '<leader>fg', builtin.live_grep)
            vim.keymap.set('n', '<leader>fc', builtin.colorscheme)
        end,
    },

    { -- Colorscheme
        "ellisonleao/gruvbox.nvim",
        priority = 1000, 
        config = true, 
        opts = {
            terminal_colors = true,
            undercurl = false,
            underline = false,
            bold = true,
            italic = {
                strings = false,
                emphasis = false,
                comments = false,
                operators = false,
                folds = false,
            },
            strikethrough = false,
            contrast = 'hard',
        },
        init = function()
            -- vim.opt.background = 'dark'
            -- vim.cmd.colorscheme 'gruvbox'
        end
    },

    { 
        'rebelot/kanagawa.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('kanagawa').setup{
                keywordStyle = { italic = false },
                commentStyle = { italic = false },
            }
            -- vim.cmd("colorscheme kanagawa")
        end
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        config = function()
            require('rose-pine').setup({
                styles = {
                    italic = false,
                    transparency = true,
                },
            })
            vim.cmd("colorscheme rose-pine")
        end
    },

})
