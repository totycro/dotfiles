-- neovim plugin: nvim-rooter

return {
  'notjedi/nvim-rooter.lua',
  opts = {
    rooter_patterns = { '.git', '.hg', '.svn' },
    trigger_patterns = { '*' },
    exclude_filetypes = { 'oil' },
    manual = false,
  }
}
