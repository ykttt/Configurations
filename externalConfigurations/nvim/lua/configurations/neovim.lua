

-- configurations/neovim.lua

local ftvim = vim.api.nvim_create_augroup('ft_vim', { clear = true })
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = 'vim',
  group = ftvim,
  command = 'setl fdm=marker',
})

vim.cmd.syntax('on')
vim.cmd.filetype({ 'indent', 'plugin', 'on' })
vim.cmd.helptags('ALL')

vim.g.configpath = '~/.config/nvim'

vim.o.ls = 2
vim.o.ch = 0
vim.o.ts = 8
vim.o.sw = 2
vim.o.sts = 2
vim.o.tm = 800
vim.o.so = 10
vim.o.tw = 0
vim.o.et = true
vim.o.tgc = true
vim.o.acd = true
vim.o.hls = true
vim.o.is = true
vim.o.si = true
vim.o.ru = true
vim.o.smd = true
vim.o.nu = true
vim.o.cul = true
-- cuc = true
vim.o.sb = true
vim.o.spr = true
vim.o.bk = false
vim.o.bomb = false
-- ambw = 'double'
vim.o.ww = vim.o.ww .. ',<,>,[,]'
vim.o.bs = 'indent,eol,start'
vim.o.cb = 'unnamedplus'
vim.o.fdm = 'marker'
