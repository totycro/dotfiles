-- Neovim plugin: luasnip

return {
  'L3MON4D3/LuaSnip',
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  event = "VeryLazy",
  config = function()
    -- Load friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
