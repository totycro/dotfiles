-- neovim plugin: lualine

return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = { 'fugitive' },
        winbar = { 'fugitive' },
      },
      always_divide_middle = true,
      globalstatus = true,
    },
    sections = {
      -- Limit mode to 3 characts
      lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 3) end } },
      lualine_b = { {
        "branch",
        fmt = function(str)
          if vim.api.nvim_strwidth(str) > 30 then
            return ("%s…"):format(str:sub(1, 29))
          end
          return str
        end,
      } },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { {
        'buffers',
        show_filename_only = false,         -- Shows shortened relative path when set to false.
        max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
        filetype_names = {                  -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
          TelescopePrompt = '',
        },
        symbols = {
          modified = ' 󰛄', -- Text to show when the buffer is modified
          alternate_file = '#', -- Text to show to identify the alternate file
          directory = '', -- Text to show when the buffer is a directory
        },
      } },
    },
    inactive_sections = {},
    winbar = {
      lualine_a = { 'filename' },
      lualine_b = { 'diff', 'diagnostics' },
      lualine_c = {},
      lualine_x = { 'encoding', 'fileformat' },
      lualine_y = { 'filetype' },
      lualine_z = { 'progress', 'location' },
    },
    inactive_winbar = {
      lualine_a = { 'filename' },
      lualine_b = { 'diff', 'diagnostics' },
      lualine_c = {},
      lualine_x = { 'encoding', 'fileformat' },
      lualine_y = { 'filetype' },
      lualine_z = { 'progress', 'location' },
    },
    tabline = {},
    extensions = { 'oil', 'trouble' }
  }
}
