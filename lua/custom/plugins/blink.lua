return {
  'saghen/blink.cmp',
  event = 'InsertEnter',
  version = '1.*',
  opts = {
    keymap = {
      preset = 'super-tab',              -- <Tab>/<S-Tab> 导航候选
    },
    completion = {
      trigger = {                       -- 让它自动触发
        show_on_insert = true,
        show_on_trigger_character = true,
      },
      menu = {
        auto_show = true,
      },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      -- 确保 LSP 源优先，包括 Emmet
      providers = {
        lsp = {
          min_keyword_length = 0,  -- 允许无关键字触发（对 Emmet 重要）
        },
      },
    },
  },
  dependencies = {
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
  },
  config = function(_, opts)
    require('blink.cmp').setup(opts)
    require('luasnip.loaders.from_vscode').lazy_load() -- 启用大量现成 snippets
  end,
}
