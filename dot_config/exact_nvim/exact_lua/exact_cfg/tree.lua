return function()
    require('nvim-tree').setup({
        modified = {
            enable = true
        },
        renderer = {
            highlight_git = 'name',
            highlight_diagnostics = 'name',
            special_files = {},
            icons = {
                web_devicons = {
                    file = {
                        color = false
                    },
                },
                show = {
                    git = false,

                },
            },
        },
        diagnostics = {
            enable = true,
        },
        
    })

    vim.keymap.set('n', '<c-n>', function() require('nvim-tree.api').tree.toggle({ find_file = true }) end)
end
