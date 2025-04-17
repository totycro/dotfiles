-- neovim theme: tokyonight

return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = function()
    return {
      style = "moon",          -- storm, moon, night, day
      light_style = "day",
      transparent = false,     -- don't set background color
      terminal_colors = false, -- configure colors of :terminal
      dim_inactive = true,     -- dims inactive windows
      day_brightness = 0.5,    -- adjust color brightness for light theme
    }
  end,
  config = function()
    local tokyonight = require('tokyonight')
    tokyonight.setup {
      on_highlights = function(hl, c)
        -- Readable line number on cursor line
        hl.CursorLineNr = { fg = c.blue, bold = true }

        -- Readable flash.nvim labels
        hl.FlashLabel = { bg = c.magenta2, bold = true, fg = c.black }

        -- Borderless Telescope
        local prompt = c.bg_dark
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
          bg = prompt,
        }
        hl.TelescopePromptBorder = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePromptTitle = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePreviewTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
      end
    }
    vim.cmd [[colorscheme tokyonight-moon]]
  end,
}
