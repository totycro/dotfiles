set bg=dark
syntax on
syntax enable
set cindent
set shiftwidth=4
set tabstop=4
set expandtab

set ignorecase
set showmode
set showmatch " zeige matchende klammer
set showcmd
set ruler
set gdefault " global
set mousehide
set autowrite

set encoding=utf-8
setglobal fileencoding=utf-8 bomb
set fileencodings=ucs-bom,utf-8,latin1
set termencoding=utf-8

set nohlsearch
"so /usr/share/vim/vimfiles/plugin/supertab.vim
"so ~/.bufexplorer.vim

"set nocindent
"set noshowmode
"set noshowcmd
"set noruler
""syntax off
"set linebreak
"set display+=lastline
" fba.....

let php_sql_query = 1
let php_htmlInStrings = 1

":map  :w!:!clear; pdflatex % && evince >/dev/null 2>&1 %<.pdf & ; clear 
"nnoremap <C-l> <Esc>:w<CR>:silent make\|redraw!\|cc<CR>
nnoremap <C-l> <Esc>:w<CR>:make!<CR>
:map  :w!:!clear; ./%
":map  :w!:!clear; php %; read
:map  :w!:!clear; elm make %
"

" latex-suite:
 filetype plugin on

" " IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse latex-suite. Set your grep
" " program to alway generate a file-name.
 set grepprg=grep\ -nH\ $*
" " OPTIONAL: This enables automatic indentation as you type.
 filetype indent on
filetype plugin indent on

"set linebreak

set dictionary+=/usr/share/dict/words

map <C-n> :n<CR>
map <C-p> :prev<CR>


"map C O/*<ESC>76a-<ESC>a*/<ESC><CR><ESC>0

" sepm coding
"let my_tab=2
"execute "set tabstop=".my_tab
"execute "set shiftwidth=".my_tab 

" don't break lines
"set textwidth=0 

"gtcad
"set shiftwidth=4
"set tabstop=4
"set noet

set linebreak
set textwidth=20000


" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0



" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()


" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
let g:neocomplete#data_directory = '~/.vim/neocomplete'




" remember last file position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" use global clipboard 
" http://stackoverflow.com/questions/9166328/how-to-copy-selected-lines-to-clipboard-in-vim
set clipboard=unnamedplus

set incsearch


execute pathogen#infect()


"let g:solarized_termtrans=1 " for urxvt pseudo-transparent background
"set bg=light
"colorscheme solarized

" let g:elm_format_autosave = 1
let g:elm_format_autosave = 1

