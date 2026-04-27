-- neovim plugin: indent-blankline.nvim

return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufEnter",
  main = "ibl",
  opts = {
    indent = {
      char = "┊",
    },
    scope = {
      enabled = true,
      show_start = true,
      show_end = true,
    },
  },
}
