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
" Using LanguageClient-neovim for haskell linting
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }
Plug 'airblade/vim-gitgutter'

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
colorscheme NeoSolarized
set termguicolors  " necessary for NeoSolarized

" remember last file position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" ctrl-n and ctrl-p for tab switching
" NOTE: one of the commands running on save makes vim think that
"       haskell files actually changed after saving, so these shortcuts
"       don't work without ! here
map <C-n> :n!<CR>
map <C-p> :prev!<CR>

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
" LanguageClient
" (mostly in use for haskell)
""""""""""""""""""""""""""""""""""""""""
let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie-wrapper'],
\}
" Auto-format on save for .hs files
autocmd BufWritePre *.hs :call LanguageClient#textDocument_formatting()

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> U :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

" TODO: needs hoogle db?
nnoremap <leader>lp :call LanguageClient#textDocument_completion()<CR>

map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
map <Leader>lc :call LanguageClient_contextMenu()<CR>
map <Leader>le :call LanguageClient#explainErrorAtPoint()<CR>

" for debugging
let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')




""""""""""""""""""""""""""""""""""""""""
" youcompleteme
""""""""""""""""""""""""""""""""""""""""
let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}



