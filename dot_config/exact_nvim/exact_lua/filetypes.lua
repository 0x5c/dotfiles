-- Loader for filetype defs

local config_path = vim.fn.stdpath('config')

for _, file in ipairs(vim.fn.readdir(config_path .. "/lua/ft", [[v:val =~ '\.lua$']])) do
    require('ft/' .. file:gsub("%.lua$", ""))
end
