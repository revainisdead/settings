" Christian's person vim settings

" General
syntax on
set showmatch "Highlight braces matching, very useful
set number

" Tabs
set tabstop=4
set softtabstop=4 "Important: Also lets you backspace 4 characters
set expandtab "Converts tabs to spaces

" UI usefuls
set wildmenu

" Searching
set incsearch "Search while typing

" Helpful git configuration
filetype on
filetype plugin on
autocmd FileType gitcommit setl tw=72

" Movement. The best part.
nnoremap j gj
nnoremap k gk

