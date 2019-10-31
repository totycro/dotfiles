""""""""""""""""""""""""""""""""""""""""
" vim-plug
""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'neomake/neomake'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'elmcast/elm-vim'
Plug 'vim-airline/vim-airline'
Plug 'Valloric/YouCompleteMe'  " NOTE: futher manual installation necessary!
Plug 'iCyMind/NeoSolarized'
call plug#end()


""""""""""""""""""""""""""""""""""""""""
" general settings
""""""""""""""""""""""""""""""""""""""""
filetype plugin on
set shiftwidth=4
set tabstop=4
set expandtab
set list  " show tabs as '>'
colorscheme NeoSolarized
set termguicolors  " necessary for NeoSolarized


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



