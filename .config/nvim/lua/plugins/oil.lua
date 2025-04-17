-- Neovim plugin: oil.nvim

return {
  'stevearc/oil.nvim',
  -- version = '2.0.0',
  lazy = false,
  opts = {
    -- Buffer-local options to use for oil buffers
    buf_options = {
      buflisted = true,
    },
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-v>"] = "actions.select_vsplit",  -- default C-s
      ["<C-s>"] = "actions.select_split",  -- default C-h
      ["<C-t>"] = false,  -- disabled, default: "actions.select_tab"
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = "actions.close",
      ["<C-l>"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = "actions.tcd",
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["g."] = "actions.toggle_hidden",
      ["g\\"] = "actions.toggle_trash",
    },
  },
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '-', '<CMD>Oil<CR>', desc = "Open parent directory" },
  },
}
