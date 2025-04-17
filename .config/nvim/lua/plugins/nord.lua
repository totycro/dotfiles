-- neovim theme: tokyonight
return {
  "dupeiran001/nord.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function ()
    vim.cmd [[colorscheme nord]]
  end
}
