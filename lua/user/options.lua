-- Basic config --
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.cursorline = true

-- Disable unnecessary providers --
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- Tab and Indentation --
vim.opt.tabstop = 4      
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Russian keybindings support --
vim.opt.langmap = "фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz,ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ"
