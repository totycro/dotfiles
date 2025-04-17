-- nvim plugin: todo-comments

return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  opts = {
    keywords = {
      FIX = {
        icon = " ", -- icon used for the sign, and in search results
        color = "error", -- can be a hex color, or a named color (see below)
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
        -- signs = false, -- configure signs for some keywords individually
      },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      TEST = { icon = " ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
  },
  keys = {
    { "<Leader>tt", "<CMD>TodoTelescope<CR>", desc = "Todos in telescope" },
    { "<Leader>tx", "<CMD>TodoTrouble<CR>",   desc = "Todos in trouble" },
    { "<Leader>tq", "<CMD>TodoLocList<CR>",   desc = "Todos in loc list" },
    { "<Leader>tl", "<CMD>TodoQuickFix<CR>",  desc = "Todos in quickfix list" },
    { "]t", function() require("todo-comments").jump_next() end,  desc = "Next todo" },
    { "[t", function() require("todo-comments").jump_prev() end,  desc = "Previous todo" },
  },
}
