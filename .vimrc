call plug#begin('~/.vim/plugged')

Plug 'https://github.com/tpope/vim-surround.git'
Plug 'morhetz/gruvbox'
Plug 'https://github.com/jiangmiao/auto-pairs.git'
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tomasiser/vim-code-dark'
Plug 'alvan/vim-closetag'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-line'

call plug#end()

" For c++ and competitive programming
autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++17 -Wshadow -Wall -o "%e" "%f" -O2 -Wno-unused-result <CR>
autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++17 -Wshadow -Wall -o "%e" "%f" -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG <CR>

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

syntax enable
" lej g:solarized_termtrans=1
" let g:solarized_termcolors=256
" set background=dark
" colorscheme codedark

autocmd vimenter * nested colorscheme gruvbox
set bg=dark

set t_Co=256

"================================================
" Defaults
"
set hlsearch
set relativenumber
set ruler
set showcmd
set incsearch
set autoindent

highlight clear LineNr
highlight LineNr ctermfg=256

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
      echo "@".getcmdline()
        execute ":'<,'>normal @".nr2char(getchar())
    endfunction

" bindings
inoremap jj  <Esc>

" ===== coc =========
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
