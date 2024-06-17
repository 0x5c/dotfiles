

vim.filetype.add({
    filename = {
        ['template'] = function(_, bufnumber)
            local line = vim.api.nvim_buf_get_lines(bufnumber, 0, 1, false)[1] or ''
            if vim.regex('\\c^# template file for'):match_str(line) ~= nil then
                return 'srcpkg'
            end
        end
    }
})

vim.treesitter.language.register('bash', 'srcpkg')
