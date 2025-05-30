--if vim.fn.argc(-1) == 0 then
--  vim.cmd(":NvimTreeOpen")
--end
vim.api.nvim_set_keymap('n', '<C-t>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end



return {
    'nvim-tree/nvim-tree.lua',
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {
            view = {
                width = 38,
            },
            renderer = {
                highlight_opened_files = 'all',
            },
            update_focused_file = {
                enable = true,
            },
            on_attach = my_on_attach,
        }

        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function(data)
              -- buffer is a directory
              local directory = vim.fn.isdirectory(data.file) == 1

              if not directory then
                return
              end

              -- change to the directory
              vim.cmd.cd(data.file)

              -- open the tree
              require("nvim-tree.api").tree.open()
            end
        })

    end

}
