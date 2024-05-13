return {
    -- "auto" | "dark" | "light"
    style = "dark",
    transparent = false,
    italics = true,
    -- bluoco colors are enabled in gui terminals per default.
    terminal = vim.fn.has("gui_running") == 1,
    guicursor   = true,
}
