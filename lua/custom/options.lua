-- 使用空格代替 Tab
vim.opt.expandtab = true

-- 每次按 Tab 输入 2 个空格（前端常用）
vim.opt.tabstop = 2

-- 自动缩进时使用 2 个空格
vim.opt.shiftwidth = 2

-- 对齐缩进时也用 2 个空格
vim.opt.softtabstop = 2

-- 自动缩进
vim.opt.smartindent = true
vim.opt.autoindent = true

-- 自动保存：当 Neovim 失去焦点时 (:h FocusLost)
vim.api.nvim_create_autocmd('FocusLost', {
  pattern = '*',
  command = 'silent! wa', -- wa = write all (保存所有文件)
})
