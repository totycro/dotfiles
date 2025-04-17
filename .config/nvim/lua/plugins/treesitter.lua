-- neovim plugin: treesitter

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      ensure_installed = {
        "bash",
        "comment",
        "css",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "go",
        "html",
        "http",
        "javascript",
        "json",
        -- "jsonc",
        -- "latex",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        -- "rst",
        "sql",
        "toml",
        -- "typescript",
        -- "tsx",
        "vim",
        -- "yaml",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      -- incremental selection
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-;>",
          node_incremental = "<C-;>",
          scope_incremental = false,
          node_decremental = "<C-,>",
        },
      },
    })
  end
}
