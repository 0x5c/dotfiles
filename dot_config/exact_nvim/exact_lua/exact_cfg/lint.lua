return function()
    local lint = require('lint')

    local severities = {
        error = vim.diagnostic.severity.ERROR,
        warning = vim.diagnostic.severity.WARN,
        info = vim.diagnostic.severity.INFO,
        style = vim.diagnostic.severity.HINT,
    }

    lint.linters_by_ft = {
        srcpkg = {'xlint', 'xshellcheck'}
    }

    lint.linters.xlint = {
        cmd = 'xlint',
        stdin = false,
        ignore_exitcode = true,
        parser = require('lint.parser').from_pattern(
            '([^:]+):([0-9]+): (.+)',
            { 'file', 'lnum', 'message' },
            { error = vim.diagnostic.severity.ERROR },
            {
                lnum = 1,
                col = 1,
                severity = 'error',
            }
        ),
    }

    lint.linters.xshellcheck = {
        cmd = 'xshellcheck',
        stdin = false,
        --args = {
        --    '--format', 'json',
        --    --'-',
        --},
        env = {
            ['XSHELLCHECK_ARGS'] = '--format=json',
            ['HOME'] = vim.fn.expand('~'),
        },
        ignore_exitcode = true,
        parser = function(output)
            if output == "" then return {} end
            local decoded = vim.json.decode(output)
            local diagnostics = {}
            for _, item in ipairs(decoded or {}) do
                table.insert(diagnostics, {
                    lnum = item.line - 1,
                    col = item.column - 1,
                    end_lnum = item.endLine - 1,
                    end_col = item.endColumn - 1,
                    code = item.code,
                    source = "shellcheck",
                    user_data = {
                        lsp = {
                            code = item.code,
                        },
                    },
                    severity = assert(severities[item.level], 'missing mapping for severity ' .. item.level),
                    message = item.message,
                })
            end
            return diagnostics
        end,
    }

    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
        callback = function()
            require('lint').try_lint()
        end,
    })
end
