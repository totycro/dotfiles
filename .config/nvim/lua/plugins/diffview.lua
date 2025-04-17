return {
  "sindrets/diffview.nvim",
  keys = {
    { '<Leader>gdh',  ':DiffviewOpen<CR>',                         desc = "Diffview changes: currend index" },
    { '<Leader>gdb',  ':DiffviewOpen -- %<CR>',                    desc = "Diffview changes: currend file" },
    { '<Leader>gdmh', ':DiffviewOpen origin/main...HEAD<CR>',      desc = "Diffview changes: btw. origin/main and branch" },
    { '<Leader>gdmb', ':DiffviewOpen origin/main...HEAD -- %<CR>', desc = "Diffview changes: btw. origin/main and current file" },
    { '<Leader>ghh',  ':DiffviewFileHistory<CR>',                  desc = "Diffview history: current branch" },
    { '<Leader>ghb',  ':DiffviewFileHistory %<CR>',                desc = "Diffview history: current file" },
    { '<Leader>gdF',  ':DiffviewToggleFiles<CR>',                  desc = "Toggle Diffview files" },
    { '<Leader>gdf',  ':DiffviewFocusFiles<CR>',                   desc = "Focus Diffview files" },
    { '<Leader>gdr',  ':DiffviewRefresh<CR>',                      desc = "Refresh Diffview" },
  },
}
