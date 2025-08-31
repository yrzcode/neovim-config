return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'html', 'javascript', 'typescript', 'vue', 'tsx', 'json', 'lua' },
    highlight = { enable = true },
    indent = { enable = true },
  },
}
