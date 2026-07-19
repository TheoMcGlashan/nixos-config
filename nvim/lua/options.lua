vim.o.relativenumber = true
vim.o.number = true
vim.o.signcolumn = "no"
vim.o.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.swapfile = false
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.clipboard = "unnamedplus"
vim.o.spell = true
vim.o.spelllang = "en_us"
vim.g.netrw_liststyle = 3
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.cmd("colorscheme tokyonight-night")

vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk = {
    options = {
				"-c",
        '-interaction=nonstopmode',
        '-synctex=1',
    },
}
