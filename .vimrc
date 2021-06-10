set showmatch "Highlight matching braces
set number "Line numbers
set mouse=a
set cmdheight=2

set backspace=indent,eol,start

set tabstop=4
set softtabstop=4 "Important: Also lets you backspace 4 characters
set expandtab "Convert tabs to spaces
set autoindent
set shiftwidth=4 "Amount of spaces for > (shift right) or < (shift left)

set ignorecase
set smartcase "If a capital is used, match case, only if ignore case is set first
set incsearch "Search while typing

autocmd FileType gitcommit setl tw=72

" Purpose: If the line is wrapped, move down into the wrapped text
" So one visual line: from line 1 to line 1 (wrapped)
" Instead of: from line 1 to line 2 (no matter what)
nnoremap j gj
nnoremap k gk
set iskeyword-=_ "Don't recognize underscore as a word, so w and b break on it

" Windows undo file auto creation
:set noundofile

" For if Ctrl-W is bound to something else while in vim
" Ctrl-j: move down a split pane
" nnoremap <C-J> <C-W><C-J>
" Ctrl-j: move up a split pane
" nnoremap: <C-K> <C-W><C-K>

" Turn off vim error sounds in Windows (no visual bell)
:set novb

call pathogen#infect()

" call plug#begin('~/.vim/plugged')
" Plugins
" Plug 'rust-lang/rust.vim'
" Plug 'sjl/badwolf'
" call plug#end()

" P is a synonym for p, overwrite it.
" Purpose: paste from system clipboard
nnoremap P "*p

" Use vnoremap for visual mode commands
" Some people remap Y to y$ (which will then copy from cursor to end of line)
" Y by default copies the whole line (I always shift-v and y to copy whole
" line, so I don't need Y, remap to opposing functionality of P:
" (Note -> If I need y$, I'll use that command or v$h aka. visual, end of
" line, one to the left (takes away EOL char))
" Purpose: copy to system clipboard
"
" for Windows
"vnoremap Y "*y
" for Linux
vnoremap Y "+y


" c: cut
" but, technically, d does the same thing, by putting it in the register
" (Note -> c also puts into insert mode, which d does not do)
" d: delete (and can paste after)
" So -> overwrite c which I dont use, to delete without being able to paste
" Black hole register is "_
" Use d in combination with black hole register to delete text (/dev/null)
vnoremap C "_d


" Instead of using the black hole register, instead remap p to use the
" 'last used' register, which y (yank) will contribute to, but not d (delete)
"nnoremap p "0p
" The problem to this second approach is that I am used to d putting it into
" the used register... I delete text and paste again to move stuff

" Commands Reference
" ---
" New:
" diw: Delete current word (better than wdb, no space at end)
" di": Delete within quotes ("delete in" quotes)
" di(: Delete within parenthesis ("delete in" parens)
" :.! ls -> Insert output from command directly into vim
" ---
" D: delete from cursor to end of line (not including EOL)
" u: Undo
" Ctrl-r: Redo
" a: go into insert mode, one character to the right
" A: go into insert mode, at end of the line
" :set paste  -> turn paste on (better indentation formatting)
" :set paste! -> turn paste off
" :%s/word_to_remove/word_to_add/g -> Search and replace

" Notes
" ---
" Check if Vim supports copy/paste from clipboard in the following ways:
" :echo has('clipboard') -> 1 for enabled clipboard
" `vim --version | grep .xterm_clipboard -o` ->
"   +xterm_clipboard MEANS CLIPBOARD IS ENABLED
"   -xterm_clipboard MEANS CLIPBOARD IS DISABLED
" To install vim that has a build with clipboard enabled:
" run `sudo apt-get purge vim`
" run `sudo apt-get autoremove vim`
" (old Ubuntu) run `apt-get install vim-gnome`
" (new Ubuntu) run `apt-get install vim-gtk3` (Working)
" Recheck `vim --version | grep clipboard`

" Use `dos2unix .vimrc` to get linux only line endings

" run `sudo apt-get install universal-ctags`
" run `ctags -R .`
" Make vim search tags recursively up the path
set tags=./tags;,tags;


filetype plugin indent on
syntax enable
