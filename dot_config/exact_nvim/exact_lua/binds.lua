-- Basic keybinds --

local k = vim.keymap

k.set('n', '<C-k>', '"_dd', {desc = "Kill Line"})
k.set('i', '<C-k>', '<C-o>"_dd', {desc = "Kill Line"})

k.set('n', '<C-s>', '<cmd>w<cr>', {desc = "Save File"})
k.set('i', '<C-s>', '<C-o><cmd>w<cr>', {desc = "Save File"})

k.set('n', '<C-q>', '<cmd>q<cr>', {desc = "Close Tab"})
k.set('i', '<C-q>', '<C-o><cmd>q<cr>', {desc = "Close Tab"})

k.set('n', '<C-z>', 'u', {desc = "Undo"})
k.set('i', '<C-z>', '<C-o>u', {desc = "Undo"})

k.set('n', '<C-y>', '<cmd>redo<cr>', {desc = "Redo"})
k.set('i', '<C-y>', '<C-o><cmd>redo<cr>', {desc = "Redo"})

k.set({'n', 'i'}, '<C-f>', '<esc>/', {desc = "Search"})

k.set('i', '<S-Left>', '<C-o>v<Left>', {desc = "Select"})
k.set('i', '<S-Right>', '<C-o>v<Right>', {desc = "Select"})
k.set('i', '<S-Up>', '<C-o>v<Up>', {desc = "Select"})
k.set('i', '<S-Down>', '<C-o>v<Down>', {desc = "Select"})

k.set('v', '<S-Left>', '<Left>', {desc = "Select"})
k.set('v', '<S-Right>', '<Right>', {desc = "Select"})
k.set('v', '<S-Up>', '<Up>', {desc = "Select"})
k.set('v', '<S-Down>', '<Down>', {desc = "Select"})

k.set('n', '<S-Left>', 'v<Left>', {desc = "Select"})
k.set('n', '<S-Right>', 'v<Right>', {desc = "Select"})
k.set('n', '<S-Up>', 'v<Up>', {desc = "Select"})
k.set('n', '<S-Down>', 'v<Down>', {desc = "Select"})

k.set('v', '<C-c>', '"+y', {desc = "Copy Selection"})
k.set('v', '<C-x>', '"+d', {desc = "Cut Selection"})

k.set({'n', 'v'}, '<C-d>', '<cmd>t.<cr>', {desc = "Duplicate Line"})
k.set('i', '<C-d>', '<C-o><cmd>t.<cr>', {desc = "Duplicate Line"})

