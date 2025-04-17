return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { '<Leader>gs', ':Neogit<CR>',           desc = "Git status (tab)" },
    { '<Leader>gS', ':Neogit kind=auto<CR>', desc = "Git status (auto)" },
    { '<Leader>gc', ':Neogit commit<CR>',    desc = "Git commit" },
  },
  config = true,
  opts = {
    -- insert mode only for empty commit messages, otherwise normal mode
    disable_insert_on_commit = "auto",
  }
}
