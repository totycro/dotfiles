-- neovim settings

-- leader key
vim.g.mapleader = '\\'

-- neovim providers ------------------------------------------------------------
--vim.g.python3_host_prog = "~/.virtualenvs/nvim3/bin/python"
vim.g.loaded_python_provider = false
vim.g.loaded_ruby_provider = false
vim.g.loaded_node_provider = false
vim.g.loaded_perl_provider = false

-- general ---------------------------------------------------------------------

-- keep multiple buffers open (even unsaved)
vim.opt.hidden = true
-- display encoding
vim.opt.encoding = 'utf-8'
-- support true colors
vim.opt.termguicolors = true
-- popup menu, smaller
--set pumheight=10
-- show cursor position
vim.opt.ruler = true
-- more space for displaying messages
--set cmdheight=2
-- one global statusline
vim.opt.laststatus = 3
-- always show tabs
vim.opt.showtabline = 1
-- hide mode display
vim.opt.showmode = false
-- enable mouse
vim.opt.mouse = 'a'
-- split below/right
vim.opt.splitbelow = true
vim.opt.splitright = true
-- recursive path operations
vim.opt.path:append("**")
-- display all matching files when tab completing
vim.opt.wildmenu = true
-- completion options (for nvim-cmp)
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }


vim.opt.ignorecase = true

-- editing ---------------------------------------------------------------------

-- Filetype
vim.cmd('filetype plugin indent on')
-- Syntax highlighting
vim.cmd('syntax enable')
-- file encoding
vim.opt.fileencoding = 'utf-8'
-- highlight current line
vim.opt.cursorline = true
-- background color
vim.opt.background = 'dark'
-- treat dash-separated-words as word text object
vim.opt.iskeyword:append('-')
-- conceal
vim.opt.conceallevel = 2
vim.opt.concealcursor = ''
-- recommended by coc, disable backups
vim.opt.backup = false
vim.opt.writebackup = false
-- faster completion, shorter timeout (default 1s)
vim.opt.updatetime = 500
vim.opt.timeoutlen = 300
vim.opt.timeout = true
-- copy/paste between vim and system
-- vim.opt.clipboard = vim.opt.clipboard + 'unnamedplus'
-- - using key mapping to buffer "+ instead to avoid clipboard pollution

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- line numbers ----------------------------------------------------------------

-- line numbers (hybrid absolute + relative)
vim.opt.number      = true
vim.opt.relativenumber      = false

-- tabs / indentation ----------------------------------------------------------

-- 4 spaces for a tab
vim.opt.tabstop     = 4
-- indent by 4 spaces
vim.opt.shiftwidth  = 4
-- smarter tabbing, understand 2 vs 4
vim.opt.smarttab    = true
-- convert tabs to spaces
vim.opt.expandtab   = true
vim.opt.smartindent = true
vim.opt.autoindent  = true


-- line wrapping ---------------------------------------------------------------
-- formatoptions (fo-table, default 'tcqj')
-- stop auto-wrapping code and comments using textwidth
-- (use gw to manually format text and comments, gq to auto-format)
-- Autocommand to keep filetype pluings from overwriting these settings.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove('t')
    vim.opt.formatoptions:remove('c')
  end,
})

-- indicate columns
vim.opt.colorcolumn = { 80, 88, 120 }
-- text width 0, don't break lines automatically
--vim.opt.textwidth = 88
-- wrap long lines
vim.opt.wrap = false
-- word wrap
vim.opt.linebreak = true
-- characters that may cause a line break (for word wrap)
-- vim.opt.breakat = " ^I!@*-+;:,./?"
-- visually indent wrapped lines
vim.opt.breakindent = true
vim.opt.showbreak = '⤷\\'
vim.opt.breakindentopt = 'sbr'

-- commenting ------------------------------------------------------------------
-- set commentstring for SQL
vim.api.nvim_create_autocmd("FileType", {
  pattern = "sql",
  callback = function()
    vim.bo.commentstring = "-- %s"
  end,
})

vim.opt.list  = true

vim.opt.clipboard = "unnamedplus"
-- Copy/Paste from sytem clipboard
vim.keymap.set('v', 'p', [["_dP]])
vim.keymap.set('v', '<Leader>y', [["+y]])
vim.keymap.set('n', '<Leader>y', [["+y]])
vim.keymap.set('n', '<Leader>p', [["+p]])


vim.keymap.set('n', '<C-n>', ":n<CR>", {})
vim.keymap.set('n', '<C-p>', ":prev<CR>", {})

