local options = {
    breakindent = true,
    expandtab = false,
    ignorecase = true,
    linebreak = true,
    number = true,
    shiftwidth = 4,
    showtabline = 4,
    smartindent = true,
    smarttab = true,
    tabstop = 4,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
