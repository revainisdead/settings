" General
filetype on
filetype plugin on
syntax on
set showmatch "Highlight braces matching, very useful
set number

" Backspace
set backspace=indent,eol,start

" Tabs
set tabstop=4
set softtabstop=4 "Important: Also lets you backspace 4 characters
set expandtab "Converts tabs to spaces

" Searching
set incsearch "Search while typing

" Helpful git configuration
autocmd FileType gitcommit setl tw=72

" Movement. The best part.
nnoremap j gj
nnoremap k gk

