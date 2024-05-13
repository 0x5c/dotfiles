local o = vim.o
local opt = vim.opt
local g = vim.g
local cmd = vim.cmd
local keymap = vim.keymap

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1


require('plugins')
require('binds')
require('filetypes')

vim.cmd('colorscheme bluloco')

-- Enable syntax highlighting
o.syntax = 'on'

-- Enable line numbers
o.number = true

-- Default to UTF-8
o.encoding = 'utf-8'

-- TODO: enforce buffers as tabs
o.hidden = false

-- TODO: wth???
o.autowrite = false

-- Disable embedded commands
o.modeline = false

-- Enable currentline highlight
o.cursorline = true

-- small rodent noises
o.mouse = 'ar'

-- Coloured background at column n
o.colorcolumn = '120'

-- Tabs=4spaces, default to tab is space
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true

-- Do not hide characters
o.conceallevel = 0

-- Hide the mode name, repalced by plugin
o.showmode = false

-- Use a preview box for replacement commands
o.inccommand = 'split'

-- Unprintable characters
o.list = true
opt.listchars = {
    tab = '› ',
    extends = '»',
    precedes = '«',
    nbsp = '␣',
    multispace = '·',
    trail = '·',
}

-- Undo stuff
o.undofile = true
o.updatetime = 250
vim.api.nvim_create_autocmd({"CursorHoldI"}, {
    pattern = '*',
    callback = function() cmd[[let &undolevels = &undolevels]] end,
})

-- 24bit colours
o.termguicolors = true

-- Python3 
g.python3_host_prog = 'python3'

-- Smartcase search
o.ignorecase = true
o.smartcase = true

-- Ask to save on :q
-- "jk... unless?"
o.confirm = true

-- Do not wrap lines by default
o.wrap = false

-- Don't autoreload changed files
o.autoread = false

-- 
opt.whichwrap:append({
    ['<'] = true,
    ['>'] = true,
    ['['] = true,
    [']'] = true,
    h = true,
    l = true,
})

vim.diagnostic.config({update_in_insert = true})

-- Start in insert mode
--cmd('startinsert')
