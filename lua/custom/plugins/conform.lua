return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      vue = { 'prettierd', 'prettier', 'eslint_d' },
      javascript = { 'prettierd', 'prettier', 'eslint_d' },
      javascriptreact = { 'prettierd', 'prettier', 'eslint_d' },
      typescript = { 'prettierd', 'prettier', 'eslint_d' },
      typescriptreact = { 'prettierd', 'prettier', 'eslint_d' },
      json = { 'prettierd', 'prettier' },
      css = { 'prettierd', 'prettier' },
      html = { 'prettierd', 'prettier' },
      markdown = { 'prettierd', 'prettier' },
      yaml = { 'prettierd', 'prettier' },
      lua = { 'stylua' },
    },
  },
  config = function(_, opts)
    require('conform').setup(opts)
    -- 快捷键：<leader>f 手动格式化
    vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
      require('conform').format { async = true, lsp_fallback = true }
    end, { desc = 'Format file' })
  end,
}
