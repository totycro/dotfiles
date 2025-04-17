-- Plugin configuration

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    local which_key = require('which-key')
    which_key.add({
      { "<Leader>b",   group = "Buffer",                            mode = 'n', silent = true },
      { "<Leader>d",   group = "Diff",                              mode = 'n', silent = true },
      { "<Leader>f",   group = "Find",                              mode = 'n', silent = true },
      { "<Leader>fg",  group = "Git",                               mode = 'n', silent = true },
      { "<Leader>fh",  group = "History",                           mode = 'n', silent = true },
      { "<Leader>fl",  group = "LSP",                               mode = 'n', silent = true },
      { "<Leader>fr",  group = "Grep",                              mode = 'n', silent = true },
      { "<Leader>fs",  group = "Symbols",                           mode = 'n', silent = true },
      { "<Leader>ft",  group = "Tags",                              mode = 'n', silent = true },
      { "<Leader>g",   group = "Git",                               mode = 'n', silent = true },
      { "<Leader>gd",  group = "Diffview changes",                  mode = 'n', silent = true },
      { "<Leader>gdm", group = "Diffview changes from origin/main", mode = 'n', silent = true },
      { "<Leader>gh",  group = "Diffview history",                  mode = 'n', silent = true },
      { "<Leader>h",   group = "Git hunk",                          mode = 'n', silent = true },
      { "<Leader>l",   group = "LSP",                               mode = 'n', silent = true },
      { "<Leader>m",   group = "Markdown",                          mode = 'n', silent = true },
      { "<Leader>n",   group = "Swap next",                         mode = 'n', silent = true },
      { "<Leader>p",   group = "Swap previous",                     mode = 'n', silent = true },
      { "<Leader>q",   group = "Quit",                              mode = 'n', silent = true },
      { "<Leader>s",   group = "Settings",                          mode = 'n', silent = true },
      { "<Leader>sc",  group = "Spell check",                       mode = 'n', silent = true },
      { "<Leader>sf",  group = "Fold",                              mode = 'n', silent = true },
      { "<Leader>st",  group = "Theme",                             mode = 'n', silent = true },
      { "<Leader>t",   group = "Todo",                              mode = 'n', silent = true },
      { "<Leader>w",   group = "Write/Quit",                        mode = 'n', silent = true },
      { "<Leader>q",   group = "Quit",                              mode = 'n', silent = true },
      { "<Leader>x",   group = "Diagnostics",                       mode = 'n', silent = true },
    })
  end,
}
