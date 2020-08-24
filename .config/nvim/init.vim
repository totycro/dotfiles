""""""""""""""""""""""""""""""""""""""""
" vim-plug
""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'elmcast/elm-vim'
Plug 'vim-airline/vim-airline'
Plug 'Valloric/YouCompleteMe'  " NOTE: futher manual installation necessary!
Plug 'iCyMind/NeoSolarized'
Plug 'neovimhaskell/haskell-vim'
" Using neomake for liting for python
Plug 'neomake/neomake'
Plug 'airblade/vim-gitgutter'
Plug 'leafgarland/typescript-vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'Glench/Vim-Jinja2-Syntax'

" Nice Multi-entry selection UI for LanguageClient
Plug 'junegunn/fzf'

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
colorscheme NeoSolarized
set termguicolors  " necessary for NeoSolarized
set bg=dark
"set bg=light

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

nnoremap <C-l> <Esc>:w<CR>:make!<CR>

" use global clipboard
" http://stackoverflow.com/questions/9166328/how-to-copy-selected-lines-to-clipboard-in-vim
set clipboard=unnamedplus

""""""""""""""""""""""""""""""""""""""""
" neomake
" (possibly check out ale as alternative)
""""""""""""""""""""""""""""""""""""""""
" run when writing a buffer (no delay).
call neomake#configure#automake('w')


""""""""""""""""""""""""""""""""""""""""
" youcompleteme
""""""""""""""""""""""""""""""""""""""""
let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}

