-- neovim plugin: gitsigns

return {
  'lewis6991/gitsigns.nvim',
  lazy = false,
  opts = {
    signs                        = {
      add          = { text = '│' },
      change       = { text = '│' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir                 = {
      follow_files = true
    },
    auto_attach                  = true,
    attach_to_untracked          = false,
    current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts      = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
      virt_text_priority = 100,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority                = 6,
    update_debounce              = 100,
    status_formatter             = nil,   -- Use default
    max_file_length              = 40000, -- Disable if file is longer than this (in lines)
    preview_config               = {
      -- Options passed to nvim_open_win
      border = 'single',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1
    },
    on_attach                    = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']h', function()
        if vim.wo.diff then return ']h' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, { expr = true, desc = "next hunk" })

      map('n', '[h', function()
        if vim.wo.diff then return '[h' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, { expr = true, desc = "previous hunk" })

      -- Hunk actions
      map('n', '<Leader>hs', gs.stage_hunk, { desc = "Stage hunk" })
      map('n', '<Leader>hr', gs.reset_hunk, { desc = "Reset hunk" })
      map('v', '<Leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, { desc = "Stage hunk" })
      map('v', '<Leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, { desc = "Reset hunk" })
      map('n', '<Leader>hS', gs.stage_buffer, { desc = "Stage buffer" })
      map('n', '<Leader>hu', gs.undo_stage_hunk, { desc = "Undo stage hunk" })
      map('n', '<Leader>hR', gs.reset_buffer, { desc = "Reset buffer" })
      map('n', '<Leader>hp', gs.preview_hunk, { desc = "Preview hunk" })
      -- diff hunks / buffer
      map('n', '<Leader>hd', gs.diffthis, { desc = "Hunk diff" })
      map('n', '<Leader>hD', function() gs.diffthis('~') end, { desc = "Diff buffer" })
      -- deleted
      map('n', '<Leader>htd', gs.toggle_deleted, { desc = "Toggle deleted" })
      -- blame
      map('n', '<Leader>gb', function() gs.blame_line { full = true } end, { desc = "Blame line" })
      map('n', '<Leader>gB', gs.toggle_current_line_blame, { desc = "Toggle current line blame" })

      -- Text object
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "Select hunk" })
    end
  }
}
