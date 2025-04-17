-- neovim plugin: vim-easy-align

return {
  'junegunn/vim-easy-align',
  keys = {
    {
      'ga',
      '<Plug>(EasyAlign)',
      mode = { 'n', 'x' },
      desc = "easy align",
    },
    {
      '<Leader>mt',
      'vip:EasyAlign *|<CR>',
      mode = { 'n' },
      desc = "Markdown: format table (paragraph)",
    },
    {
      '<Leader>mt',
      ':EasyAlign *|<CR>',
      mode = { 'x' },
      desc = "Markdown: format table (selection)",
    },
  },
}
