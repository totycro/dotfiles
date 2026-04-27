-- neovim plugin: treesitter

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local treesitter = require("nvim-treesitter")
    local ensure_installed = {
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
    }

    treesitter.install(ensure_installed)

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("config-treesitter", { clear = true }),
      callback = function(args)
        local ok = pcall(vim.treesitter.start, args.buf)
        if ok then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end
}
