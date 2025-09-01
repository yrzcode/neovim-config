return {
  'stevearc/conform.nvim',
  event = 'BufReadPre',
  opts = {
    formatters_by_ft = {
      vue = { 'prettierd', 'prettier', 'eslint_d' },
      javascript = { 'prettierd', 'prettier', 'eslint_d' },
      javascriptreact = { 'prettierd', 'prettier', 'eslint_d' },
      typescript = { 'prettierd', 'prettier', 'eslint_d' },
      typescriptreact = { 'prettierd', 'prettier', 'eslint_d' },
      prisma = { 'prisma-fmt' },
      json = { 'prettierd', 'prettier' },
      css = { 'prettierd', 'prettier' },
      html = { 'prettierd', 'prettier' },
      markdown = { 'prettierd', 'prettier' },
      yaml = { 'prettierd', 'prettier' },
      lua = { 'stylua' },
    },
    format_on_save = function (bufnr)
        return {
            timeout_ms = 2000,
            lsp_fallback = true,
        }
    end,
  },
  config = function(_, opts)
    -- 添加自定义 Prisma 格式化器
    opts.formatters = {
      ['prisma-fmt'] = {
        command = 'prisma',
        args = { 'format', '--schema', '$FILENAME' },
        stdin = false,
        cwd = require('conform.util').root_file({ 'package.json', '.git' }),
      },
    }
    
    require('conform').setup(opts)
    -- 快捷键：<leader>f 手动格式化
    vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
      require('conform').format { async = true, lsp_fallback = true }
    end, { desc = 'Format file' })
  end,
}
