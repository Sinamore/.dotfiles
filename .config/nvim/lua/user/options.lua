local options = {
    breakindent = true,
    expandtab = true,
    ignorecase = true,
    linebreak = true,
    number = true,
    shiftwidth = 2,
    showtabline = 2,
    smartindent = true,
    smarttab = true,
    tabstop = 2,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
