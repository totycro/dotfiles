-- neovim plugin: telescope
return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'folke/trouble.nvim',
    {
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
		},
    'nvim-telescope/telescope-ui-select.nvim'
  },
  keys = function(_, _)
    local builtin = require('telescope.builtin')
    return {
      { "<Leader>bf", builtin.buffers, desc = "Find buffers" },
      -- Files
      { "<Leader>ff", builtin.find_files, desc = "Find files" },
      -- Search / grep / fuzzy-find
      { "<Leader>fra", builtin.live_grep, desc = "Seach in cwd" },
      { "<Leader>frb", builtin.current_buffer_fuzzy_find, desc = "Search in buffer" },
      -- Locations
      { "<Leader>fta", builtin.tags, desc = "Find tags (project)" },
      { "<Leader>ftg", builtin.grep_string, desc = "Grep string under cursor (project)" },
      { "<Leader>ftc", function() builtin.tags({ default_text = vim.fn.expand('<cword>') }) end, desc = "Find tag under cursor" },
      { "<Leader>ftb", builtin.current_buffer_tags, desc = "Find tags (buffer)" },
      { "<Leader>ftt", ':!rg --color=never --files | ctags -R --links=no -L -<CR>', desc = "Rebuild ctags" },
      { "<Leader>fm", builtin.marks, desc = "Marks" },
      { "<Leader>fq", builtin.quickfix, desc = "Quickfix list" },
      { "<Leader>fo", builtin.loclist, desc = "Location list" },
      { "<Leader>fj", builtin.jumplist, desc = "Jumplist" },
      { "<Leader>fy", builtin.registers, desc = "Registers" },
      -- Help tags
      { "<Leader>f1", builtin.help_tags, desc = "Help tags" },
      -- Filetypes
      { "<Leader>fty", builtin.filetypes, desc = "File types" },
      -- Spelling suggestions
      { "<Leader>fz", builtin.spell_suggest, desc = "Spellings suggestions" },
      -- Key mappings
      { "<Leader>fk", builtin.keymaps, desc = "Key mappings" },
      -- Treesitter symbols
      { "<Leader>fT", builtin.treesitter, desc = "Treesitter symbols" },
      -- LSP references / diagnostics
      { "<Leader>fsd", builtin.lsp_dynamic_workspace_symbols, desc = "Dynamic workspace symbols" },
      { "<Leader>fsw", builtin.lsp_workspace_symbols, desc = "Workspace symbols" },
      { "<Leader>fsb", builtin.lsp_document_symbols, desc = "Document symbols" },
      { "<Leader>fli", builtin.lsp_implementations, desc = "LSP: implementations" },
      { "<Leader>flt", builtin.lsp_type_definitions, desc = "LSP: type definitions" },
      { "<Leader>fld", builtin.lsp_definitions, desc = "LSP: definitions" },
      { "<Leader>flr", builtin.lsp_references, desc = "LSP: references" },
      { "<Leader>fd", builtin.diagnostics, desc = "Diagnostics" },
      -- List available telescope pickers
      { "<Leader>fp", builtin.builtin, desc = "Telescope pickers" },
      -- Git
      { "<Leader>fgf", builtin.git_files, desc = "Git ls-files" },
      { "<Leader>fgb", builtin.git_branches, desc = "Git branches" },
      { "<Leader>fgs", builtin.git_status, desc = "Git status" },
      { "<Leader>fgt", builtin.git_stash, desc = "Git stash" },
      { "<Leader>fgca", builtin.git_commits, desc = "Git commits" },
      { "<Leader>fgcb", builtin.git_bcommits, desc = "Git commits for buffer" },
      -- History
      { "<Leader>fhf", builtin.oldfiles, desc = "File history" },
      { "<Leader>fhc", builtin.command_history, desc = "Command history" },
      { "<Leader>fh/", builtin.search_history, desc = "Search history" },
    }
  end,
  config = function(_, _)
    local actions = require('telescope.actions')
    local telescope = require('telescope')
    local themes = require('telescope.themes')
    local trouble = require('trouble.sources.telescope')

    telescope.setup {
      defaults = {
        mappings = {
          i = {
            ["<c-t>"] = trouble.open,
            ["<c-n>"] = actions.cycle_history_next,
            ["<c-p>"] = actions.cycle_history_prev,
            ["<c-j>"] = actions.move_selection_next,
            ["<c-k>"] = actions.move_selection_previous,
            ["<c-s>"] = actions.to_fuzzy_refine,
          },
          n = { ["<c-t>"] = trouble.open },
        },
      },
      pickers = {
        buffers = {
          mappings = {
            i = { ["<c-d>"] = actions.delete_buffer },
            n = { ["<c-d>"] = actions.delete_buffer },
          },
        },
      },
			extensions = {
				fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },
				['ui-select'] = {
          themes.get_dropdown(),
        },
			},
			vimgrep_argument = { 'rg', '--smart-case' }
		}

		telescope.load_extension('fzf')
		telescope.load_extension('ui-select')
  end,
}
