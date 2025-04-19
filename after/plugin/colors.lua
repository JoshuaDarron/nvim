function ColorMyPencils(color)
    color = color or "dracula"
    vim.cmd.colorscheme(color)

    -- Basic transparency
    vim.api.nvim_set_hl(0, "Normal",        { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC",      { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat",   { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder",   { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatTitle",    { bg = "none" })
    vim.api.nvim_set_hl(0, "WinSeparator",  { bg = "none" })

    -- Statusline
    vim.api.nvim_set_hl(0, "StatusLine",    { bg = "none" })
    vim.api.nvim_set_hl(0, "StatusLineNC",  { bg = "none" })

    -- Pmenu (autocomplete, telescope, etc.)
    vim.api.nvim_set_hl(0, "Pmenu",         { bg = "none" })
    vim.api.nvim_set_hl(0, "PmenuSel",      { bg = "none" })
    vim.api.nvim_set_hl(0, "PmenuSbar",     { bg = "none" })
    vim.api.nvim_set_hl(0, "PmenuThumb",    { bg = "none" })

    -- Sign and fold columns
    vim.api.nvim_set_hl(0, "SignColumn",    { bg = "none" })
    vim.api.nvim_set_hl(0, "FoldColumn",    { bg = "none" })

    -- VertSplit (between windows)
    vim.api.nvim_set_hl(0, "VertSplit",     { bg = "none" })

    vim.api.nvim_set_hl(0, "NvimTreeNormal",      { bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeNormalNC",    { bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeCursorLine",  { bg = "none" })
    
    -- Indent Setup
    require("ibl").setup()
end

ColorMyPencils()

