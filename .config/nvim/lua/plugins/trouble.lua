-- neovim plugin: trouble

return {
  'folke/trouble.nvim',
  keys = {
    { "<Leader>xa", "<cmd>Trouble diagnostics toggle<CR>",              desc = "Toggle project diagnostics" },
    { "<Leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Toggle buffer diagnostics" },
    { "gD",         "<cmd>Trouble lsp_type_definitions<CR>",            desc = "Goto declaration" },
    { "gd",         "<cmd>Trouble lsp_definitions<CR>",                 desc = "Goto definition" },
    { "gi",         "<cmd>Trouble lsp_implementations<CR>",             desc = "Goto implementation" },
    { "gr",         "<cmd>Trouble lsp_references<CR>",                  desc = "Show references" },
  },
  opts = {},
}
