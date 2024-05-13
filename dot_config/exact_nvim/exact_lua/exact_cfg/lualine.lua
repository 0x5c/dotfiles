local mode_map = {
    --['NORMAL'] = 'N',
    --['O-PENDING'] = 'N?',
    ['INSERT'] = 'I',
    --['VISUAL'] = 'V',
    --['V-BLOCK'] = 'V-B',
    --['V-LINE'] = 'V-L',
    --['V-REPLACE'] = 'V-R',
    --['REPLACE'] = 'R',
    --['COMMAND'] = '!',
    --['SHELL'] = 'SH',
    --['TERMINAL'] = 'T',
    --['EX'] = 'X',
    --['S-BLOCK'] = 'S-B',
    --['S-LINE'] = 'S-L',
    --['SELECT'] = 'S',
    --['CONFIRM'] = 'Y?',
    --['MORE'] = 'M',
}

local function cursorloc()
    local line = vim.fn.line('.')
    local col = vim.fn.virtcol('.')
    local total = vim.fn.line('$')
    local percent = math.floor(line / total * 100)
    return string.format('%d,%d/%d %d%%%%', col, line, total, percent)
end

local function fileflags()
    local type = nil
    if vim.bo.filetype == '' then
        type = '---'
    else
        type = vim.bo.filetype or '---'
    end
    local format = vim.bo.fileformat

    local enc = vim.opt.fileencoding:get()
    local encoding = nil
    if enc == '' then
        encoding = '---'
    else
        encoding = vim.opt.fileencoding:get() or '---'
    end
    return string.format('%s %s:%s', type, format, encoding)
end

return {
    options = {
        component_separators = {left = '', right = ''},
        section_separators = '',
    },
    sections = {
        lualine_a = { {'mode', fmt = function(s) return mode_map[s] or s end} },
        lualine_b = {},
        lualine_c = {
            {'filename', path = 1, symbols = {readonly = '[RO]'}},
            {cursorloc},
        },
        lualine_x = {{'diagnostics', update_in_insert = true}},
        lualine_y = {'diff'},
        lualine_z = {fileflags},
        --lualine_z = {
        --    {'filetype', icons_enabled = false, separator=''},
        --    {'fileformat', icons_enabled = false, padding = 0},
        --    {'encoding', padding = {left = 0, right = 1}},
        --},
    },
    tabline = {
        lualine_c = {},
        lualine_b = {},
        lualine_a = {
            {
                'tabs',
                max_length = vim.o.columns,
                mode = 1,
                path = 1,
                tabs_color = {
                    inactive = 'lualine_b_active',
                },
                show_modified_status = true,
                symbols = { modified = '', },
            },
            {
                function()
                vim.o.showtabline = 1
                return ''
                --HACK: lualine will set &showtabline to 2 if you have configured
                --lualine for displaying tabline. We want to restore the default
                --behavior here.
                end,
            },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    extensions = { 'nvim-tree', }
}
