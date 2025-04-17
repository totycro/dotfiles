-- neovim plugin: indent-blankline.nvim

return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufEnter",
  main = "ibl",
  opts = {
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
    },
  },
}
