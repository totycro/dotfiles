""""""""""""""""""""""""""""""""""""""""
" vim-plug
""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'elmcast/elm-vim'
Plug 'vim-airline/vim-airline'
Plug 'neovimhaskell/haskell-vim'
" Using neomake for liting for python
Plug 'neomake/neomake'
Plug 'airblade/vim-gitgutter'
Plug 'leafgarland/typescript-vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'wellle/context.vim'
Plug 'towolf/vim-helm'
Plug 'sheerun/vim-polyglot'

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


" 2 spaces indent for yaml
" https://stackoverflow.com/questions/26962999/wrong-indentation-when-editing-yaml-in-vim
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>


autocmd BufReadPost Dockerfile* set syntax=dockerfile

" fzf
nnoremap <c-f> :Files<cr>
