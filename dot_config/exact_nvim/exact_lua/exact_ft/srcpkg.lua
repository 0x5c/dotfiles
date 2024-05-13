

vim.filetype.add({
    filename = {
        ['template'] = function(_, bufnumber)
            local line = vim.filetype.getlines(bufnumber, 1):lower()
            if line:find('^# template file for') then
                return 'srcpkg'
            end
        end
    }
})

vim.treesitter.language.register('bash', 'srcpkg')
