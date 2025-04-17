-- Neovim plugin: nvim-cmp
-- also: cmp-buffer, cmp-cmdline, cmp-nvim-lsp, cmp-path, cmp-vsnip

return {
  'hrsh7th/nvim-cmp',          -- autocompletion library
  dependencies = {
    'hrsh7th/cmp-buffer',      -- autocomplete buffer text
    'hrsh7th/cmp-cmdline',     -- autocomplete commands
    'hrsh7th/cmp-nvim-lsp',    -- autocomplete from LSP
    'hrsh7th/cmp-path',        -- autocomplete paths
    'saadparwaiz1/cmp_luasnip' -- autocomplete LuaSnip
  },
  event = "VeryLazy",
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    -- Global cmp config (for all types, keybindings, ...)
    cmp.setup({
      -- snippet completion via vsnip
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      -- window decorations for source groups
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      -- keybindings
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-c>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<C-n>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<C-p>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
      }, {
        { name = 'path' },
      })
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'buffer' },
      })
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'buffer' },
      })
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' },
      })
    })
  end,
}
