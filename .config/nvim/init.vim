""""""""""""""""""""""""""""""""""""""""
" vim-plug
""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'elmcast/elm-vim'
Plug 'vim-airline/vim-airline'
Plug 'neovimhaskell/haskell-vim'
" Using neomake for linting for python
Plug 'neomake/neomake'
Plug 'airblade/vim-gitgutter'
Plug 'leafgarland/typescript-vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'wellle/context.vim'
Plug 'towolf/vim-helm'
Plug 'sheerun/vim-polyglot'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

Plug 'f-person/git-blame.nvim'
Plug 'rhysd/git-messenger.vim'
"Plug 'duane9/nvim-rg'

" black is now called from pyright
"Plug 'a-vrma/black-nvim', {'do': ':UpdateRemotePlugins'}

let g:coc_global_extensions = ['coc-pyright', 'coc-yaml', 'coc-json', 'coc-tsserver', 'coc-vetur', 'coc-prettier', '@yaegassy/coc-ruff']
" Plug 'fannheyward/coc-pyright'

" completion:
" coc seems to work with some language server to enable k8s completions, so use this
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'Valloric/YouCompleteMe'  " NOTE: futher manual installation necessary!

" color:
Plug 'drewtempelmeyer/palenight.vim'
Plug 'iCyMind/NeoSolarized'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'


Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Plug 'liuchengxu/vim-which-key'

" Plug 'easymotion/vim-easymotion'

call plug#end()

""""""""""""""""""""""""""""""""""""""""
" general settings
""""""""""""""""""""""""""""""""""""""""
filetype plugin on
set shiftwidth=4
set tabstop=4
set expandtab
set ignorecase
set list  " show tabs as '>'
set gdefault
"colorscheme NeoSolarized
"colorscheme palenight
"let ayucolor="dark"   " for dark version of theme
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"colorscheme ayu
set termguicolors
set bg=light
set bg=dark
colorscheme nord

set splitright
set inccommand=split
set wildmenu

" remember last file position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" ctrl-n and ctrl-p for tab switching
" NOTE: one of the commands running on save makes vim think that
"       haskell files actually changed after saving, so these shortcuts
"       don't work without ! here
"map <C-n> :n!<CR>
"map <C-p> :prev!<CR>
" NOTE: since not working on haskell, use the safe versions to avoid data loss
map <C-n> :n<CR>
map <C-p> :prev<CR>

" nnoremap <C-l> <Esc>:w<CR>:make!<CR>

" use global clipboard
" http://stackoverflow.com/questions/9166328/how-to-copy-selected-lines-to-clipboard-in-vim
set clipboard=unnamedplus

""""""""""""""""""""""""""""""""""""""""
" neomake
" (possibly check out ale as alternative)
""""""""""""""""""""""""""""""""""""""""
" run when writing a buffer (no delay).
"call neomake#configure#automake('w')


""""""""""""""""""""""""""""""""""""""""
" youcompleteme
""""""""""""""""""""""""""""""""""""""""
let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}


" 2 spaces indent for yaml
" https://stackoverflow.com/questions/26962999/wrong-indentation-when-editing-yaml-in-vim
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>


autocmd BufReadPost Dockerfile* set syntax=dockerfile

" fzf
nnoremap <c-f> :Files<cr>
nnoremap <c-j> :Rg<cr>

nnoremap <Leader>fw :Rg <C-R><C-W><space>
nnoremap <silent> <Leader>fa :Rg<CR> 

" neomake / python
let g:neomake_python_enabled_makers = ['python', 'flake8', 'mypy']

" black
" not present in docker image ?!?
" nnoremap <buffer><silent> <c-i> <cmd>call Black()<cr>

" coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

set mouse=n


nnoremap <C-t> :NvimTreeToggle<CR>

lua << EOF
require'nvim-tree'.setup({
  view = {
    width = 35,
  },
  renderer = {
      highlight_opened_files = 'all',
  },
})
local function open_nvim_tree(data)
  -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
  local directory = vim.fn.isdirectory(data.file) == 1
  if directory then
    vim.cmd.cd(data.file)
    require("nvim-tree.api").tree.open()
  end
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
EOF

" vim-which-key: press lead, wait 1  sec, get popup with available commands
" nnoremap <silent> <leader> :WhichKey '\'<CR>


" git blame
let g:gitblame_message_template = '<author> • <date> • <summary> • <sha>'


" vim-easymotion

" <Leader>f{char} to move to {char}
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
"nmap s <Plug>(easymotion-overwin-f2)

" Move to line
" map <Leader>l <Plug>(easymotion-bd-jk)
" nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
" map  <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>w <Plug>(easymotion-overwin-w)


