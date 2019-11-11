" General
filetype on
filetype plugin on
syntax on
set showmatch "Highlight braces matching, very useful
set number
set mouse=a
set cmdheight=2
set novisualbell

" Backspace
set backspace=indent,eol,start

" Tabs
set tabstop=4
set softtabstop=4 "Important: Also lets you backspace 4 characters
set expandtab "Converts tabs to spaces
set autoindent
set shiftwidth=4 "When using < or > to indent

" Searching
set incsearch "Search while typing
set ignorecase
set smartcase "If a cap is used, match case

" Helpful git configuration
autocmd FileType gitcommit setl tw=72

" Movement. The best part.
nnoremap j gj
nnoremap k gk
set iskeyword-=_ "Don't recognize underscore as a word, so w and b break on it


" For if Ctrl-W is bound to something else while in vim
" Ctrl-j: move down a split pane
" nnoremap <C-J> <C-W><C-J>
" Ctrl-k: move up a split pane
" nnoremap <C-K> <C-W><C-K>


" call plug#begin('~/.vim/plugged')
" Plugins
" Plug 'rust-lang/rust.vim'
" Plug 'sjl/badwolf'
" call plug#end()
