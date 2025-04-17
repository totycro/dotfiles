-- neovim plugin: flash.nvim

return {
  'folke/flash.nvim',
  opts = {
    modes = {
      search = { enabled = false },
      char = { autohide = false, },
    },
    highlight = {
      backdrop = false,
    },
  },
  keys = {
    -- Default: jump/search using /? or fF
    'f', 'F', 't', 'T', '/',
    -- Toggle flash in search
    {
      '<C-s>',
      mode = { 'c' },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash search"
    },
    -- Jump/search default
    {
      'sf',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump()
      end,
      desc = "Flash search",
    },
    -- Jump/search initialized with word under cursor
    {
      'gs',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump({
          pattern = vim.fn.expand("<cword>"),
        })
      end,
      desc = "Flash search, for current word",
    },
    -- Select treesitter notes
    {
      'Sf',
      mode = { 'n', 'o' },
      function()
        require('flash').treesitter()
      end,
      desc = "Flash treesitter select",
    },
    -- Remote action: perform motions in remote locations
    -- only useful in operator pending mode, like `ygR`, then jump to a word,
    -- then `iw` to yank that word and return to the original location.
    {
      'gR',
      mode = { 'o' },
      function()
        require('flash').remote()
      end,
      desc = "Flash remote",
    },
    -- Search in treesitter nodes
    {
      'gS',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').treesitter_search()
      end,
      desc = "Flash treesitter search",
    },
    -- Remote diagnostics with highlight
    {
      'gW',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump({
          matcher = function(win)
            ---@param diag Diagnostic
            return vim.tbl_map(function(diag)
              return {
                pos = { diag.lnum + 1, diag.col },
                end_pos = { diag.end_lnum + 1, diag.end_col - 1 },
              }
            end, vim.diagnostic.get(vim.api.nvim_win_get_buf(win)))
          end,
          action = function(match, state)
            vim.api.nvim_win_call(match.win, function()
              vim.api.nvim_win_set_cursor(match.win, match.pos)
              vim.diagnostic.open_float()
            end)
            state:restore()
          end,
        })
      end,
      desc = "Flash remote diagnostics",
    },
  },
}
