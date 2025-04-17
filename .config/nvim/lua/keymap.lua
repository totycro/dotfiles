-- neovim key mappings

-- Make all keymaps silent by default
local keymap_set = vim.keymap.set
vim.keymap.set = function(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  return keymap_set(mode, lhs, rhs, opts)
end

-- windows and buffers ---------------------------------------------------------

-- resize windows: ctrl + alt + hjkl
vim.keymap.set("n", '<C-M-j>', ':resize -2<CR>', { desc = "shrink window vert." })
vim.keymap.set("n", '<C-M-k>', ':resize +2<CR>', { desc = "grow window vert." })
vim.keymap.set("n", '<C-M-h>', ':vertical resize -2<CR>', { desc = "shrink window horiz." })
vim.keymap.set("n", '<C-M-l>', ':vertical resize +2<CR>', { desc = "grow window horiz." })
-- window navigation: ctrl + hjkl
vim.keymap.set("n", '<C-h>', '<C-w>h', { desc = "to left window" })
vim.keymap.set("n", '<C-j>', '<C-w>j', { desc = "to window below" })
vim.keymap.set("n", '<C-k>', '<C-w>k', { desc = "to window above" })
vim.keymap.set("n", '<C-l>', '<C-w>l', { desc = "to right window" })
vim.keymap.set("n", '<C-h>', ':TmuxNavigateLeft<CR>', { desc = "to left window" })
vim.keymap.set("n", '<C-j>', ':TmuxNavigateDown<CR>', { desc = "to window below" })
vim.keymap.set("n", '<C-k>', ':TmuxNavigateUp<CR>', { desc = "to window above" })
vim.keymap.set("n", '<C-l>', ':TmuxNavigateRight<CR>', { desc = "to right window" })
-- switch buffers with ][b or alt + hl
vim.keymap.set("n", ']b', ':bnext<CR>', { desc = "next buffer" })
vim.keymap.set("n", '[b', ':bprevious<CR>', { desc = "previous buffer" })
vim.keymap.set("n", '<M-l>', ':bnext<CR>', { desc = "next buffer" })
vim.keymap.set("n", '<M-h>', ':bprevious<CR>', { desc = "previous buffer" })


-- delete buffers
vim.keymap.set("n", '<Leader>bd', ':bd<CR>', { desc = "delete this buffer" })
vim.keymap.set("n", '<Leader>bo', ':%bd<bar>e#<bar>bd#<CR>', { desc = "delete other buffers" })
vim.keymap.set("n", '<Leader>ba', ':%bd<CR>', { desc = "delete all buffers" })

-- escape / save / quit ---------------------------------------------------------

-- escape by ctrl-c
vim.keymap.set("n", '<C-c>', '<Esc>', { desc = "Esc" })

-- save/quite by leader+w/q
vim.keymap.set("n", '<Leader>ww', ':w<CR>', { desc = "Write" })
vim.keymap.set("n", '<Leader>wW', ':wa<CR>', { desc = "Write all" })
vim.keymap.set("n", '<Leader>wq', ':wq<CR>', { desc = "Write and quit" })
vim.keymap.set("n", '<Leader>wQ', ':wqa<CR>', { desc = "Write and quit all" })
vim.keymap.set("n", '<Leader>qq', ':q<CR>', { desc = "Quit" })
vim.keymap.set("n", '<Leader>qQ', ':qa<CR>', { desc = "Quit all" })
vim.keymap.set("n", '<Leader>qF', ':qa!<CR>', { desc = "Force quit all" })

-- tabs ------------------------------------------------------------------------
-- switch tabs with ][T
--vim.keymap.set("n", ']T', ':tabnext<CR>', { desc = "next tab" })
--vim.keymap.set("n", '[T', ':tabprevious<CR>', { desc = "previous tab" })
-- close tab
--vim.keymap.set("n", '<Leader>qt', ':tabclose<CR>', { desc = "Close tab" })

-- movement --------------------------------------------------------------------

-- move in long lines
-- nnoremap k gk
-- nnoremap j gj

-- indentation -----------------------------------------------------------------

-- indent/unindent by >/< and tab/shift-tab
vim.keymap.set("x", '>', '>gv', { desc = "Indent" })
vim.keymap.set("x", '<', '<gv', { desc = "Dedent" })
vim.keymap.set("x", '<TAB>', '>gv', { desc = "Indent" })
vim.keymap.set("x", '<S-TAB>', '<gv', { desc = "Dedent" })

-- selection / clipboard / search ----------------------------------------------

-- yank to end of line
vim.keymap.set("n", 'Y', 'y$', { desc = "Yank to end of line" })

-- paste from and copy to system clipboard
--vim.keymap.set("n", 'gy', '"+y', { desc = "Yank to clipboard" })
--vim.keymap.set("n", 'gp', '"+p', { desc = "Paste from clipboard to right" })
--vim.keymap.set("n", 'gP', '"+P', { desc = "Paste from clipboard to left" })
--vim.keymap.set("n", 'gY', '"+y$', { desc = "Yank to end of line to clipboard" })

-- reselect pasted text
vim.keymap.set("n", 'gV', '`[v`]', { desc = "Reselect pasted text" })

-- yank from selection to system clipboard
--vim.keymap.set("x", 'gy', '"+y', { desc = "yank selection to clipboard" })

-- select all
vim.keymap.set("n", '<Leader>sa', '<ESC>ggVG', { desc = "Select all" })

-- editing shortcuts -----------------------------------------------------------

-- silence search highlighting
vim.keymap.set("n", '<Leader>sh', ':nohlsearch<Bar>:echo<CR>', { desc = "search highlight off" })
-- local buffer settings
-- wrap/nowrap local buffer
vim.keymap.set("n", '<Leader>sw', ':setlocal wrap!<CR>', { desc = "toggle line wrap" })
-- spell checking
vim.keymap.set("n", '<Leader>scd', ':setlocal spell! spelllang=de<CR>', { desc = "Spell check DE" })
vim.keymap.set("n", '<Leader>sce', ':setlocal spell! spelllang=en<CR>', { desc = "Spell check EN" })
-- foldmethod
vim.keymap.set("n", '<Leader>sfm', ':setlocal foldmethod=manual<CR>', { desc = "Fold manual" })
vim.keymap.set("n", '<Leader>sfi', ':setlocal foldmethod=indent<CR>', { desc = "Fold indent" })
vim.keymap.set("n", '<Leader>sfs', ':setlocal foldmethod=syntax<CR>', { desc = "Fold syntax" })
vim.keymap.set("n", '<Leader>sfe', ':setlocal foldmethod=expr<CR>:setlocal foldexpr=nvim_treesitter#foldexpr()<CR>',
  { desc = "expr Fold treesitter" })
vim.keymap.set("n", '<Leader>sfo', ':setlocal nofoldenable<CR>', { desc = "Fold off" })
-- generate uuid
vim.keymap.set("n", '<Leader>u', 'i<C-r>=trim(system("uuidgen"))<CR>', { desc = "Generate UUID" })

-- diff ------------------------------------------------------------------------

vim.keymap.set("n", '<Leader>dt', ':diffthis<CR>', { desc = "diff this buffer" })
vim.keymap.set("n", '<Leader>do', ':diffoff<CR>', { desc = "diff off" })
vim.keymap.set("n", '<Leader>dq', ':diffoff!<CR>', { desc = "diff off (force)" })
vim.keymap.set("n", '<Leader>du', ':diffupdate<CR>', { desc = "diff update" })
vim.keymap.set({ "n", "x" }, '<Leader>dhg', ':diffget<CR>', { desc = "diff update" })
vim.keymap.set({ "n", "x" }, '<Leader>dhp', ':diffput<CR>', { desc = "diff update" })
vim.keymap.set("n", '<Leader>ds', '/[<=>]\\{7}<CR>', { desc = "search hunk markers" })

-- markdown --------------------------------------------------------------------

vim.keymap.set("n", '<Leader>mi', '<ESC>i- [ ] ', { desc = "Markdown task: new in line" })
vim.keymap.set("n", '<Leader>mI', '<ESC>I- [ ] <ESC>', { desc = "Markdown task: new at start of line" })
vim.keymap.set("n", '<Leader>mo', '<ESC>o- [ ] ', { desc = "Markdown task: new below line" })
vim.keymap.set("n", '<Leader>mO', '<ESC>O- [ ] ', { desc = "Markdown task: new above line" })
vim.keymap.set("n", '<Leader>md', '<ESC>0f[lrx<ESC>', { desc = "Markdown task: mark done" })
vim.keymap.set("n", '<Leader>mD', '<ESC>0f[lr <ESC>', { desc = "Markdown task: mark not done" })
vim.keymap.set("n", '<Leader>mp', '<CMD>!firefox %&<CR>', { desc = "Markdown: preview in browser" })

-- theme -----------------------------------------------------------------------
vim.keymap.set("n", '<Leader>stl', ':set background=light<CR>', { desc = "Light theme" })
vim.keymap.set("n", '<Leader>std', ':set background=dark<CR>', { desc = "Dark theme" })
