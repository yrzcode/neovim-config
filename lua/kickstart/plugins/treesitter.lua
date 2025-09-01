return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'html', 'javascript', 'typescript', 'vue', 'tsx', 'json', 'lua', 'prisma' },
    highlight = { enable = true },
    indent = { enable = true },
  },
}
