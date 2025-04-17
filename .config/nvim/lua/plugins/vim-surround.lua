return {
  'tpope/vim-surround',
  dependencies = { "tpope/vim-repeat" },
  keys = {
    "ys", "cs", "ds",
    { "S", mode = { "x" } },
  },
}
