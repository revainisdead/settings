set showmatch   "Highlight matching braces
set number      "Line numbers
set mouse=a     "Allow mouse interaction
set cmdheight=2 "Command window: 2 lines high
"set noruler     "Remove blinking cursor

set backspace=indent,eol,start

set tabstop=4       "Tab indents 4 spaces
set softtabstop=4   "Important: Also lets you backspace 4 characters
set expandtab       "Convert tabs to spaces
set autoindent      "Auto indent when entering new line, etc.
set shiftwidth=4    "Amount of spaces for > (shift right) or < (shift left)

set ignorecase  "Works together with smartcase, see next line.
set smartcase   "If a capital is used, match case, only if ignore case is set first

set incsearch   "Search while typing

autocmd FileType gitcommit setl tw=72   "Set max commit line length when rebasing, amend commit, or commit without message

" Purpose: If the line is wrapped, move down into the wrapped text
" So one visual line: from line 1 to line 1 (wrapped)
" Instead of: from line 1 to line 2 (no matter what)
nnoremap j gj
nnoremap k gk
set iskeyword-=_    "Don't recognize underscore as a word, so w and b break on it

if has("unix")
    " Linux
    set undofile
    set history=50     "Keep 50 lines of command line history

    " See salt states for automatic undo directory creation
    " https://github.com/revainisdead/saltstates/blob/master/vim/init.sls
    set undodir=~/.vim/undo
else
    " Windows
    set noundofile
endif

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

" Description: P is a synonym for p, overwrite it.
" Purpose: paste from system clipboard
nnoremap P "*p

" Description:
" Use vnoremap for visual mode commands
" Some people remap Y to y$ (which will then copy from cursor to end of line)
" Y by default copies the whole line (I always shift-v and y to copy whole
" line, so I don't need Y, remap to opposing functionality of P:
" (Note -> If I need y$, I'll use that command or v$h aka. visual, end of
" line, one to the left (takes away EOL char))
"
" Purpose: copy to system clipboard
if has("unix")
    " for Linux
    vnoremap Y "+y
else
    " for Windows
    vnoremap Y "*y
endif

" Description:
" c: cut
" but, technically, d does the same thing, by putting it in the register
" (Note -> c also puts into insert mode, which d does not do)
" d: delete (and can paste after)
" So -> overwrite c which I dont use, to delete without being able to paste
" Black hole register is "_
" Use d in combination with black hole register to delete text (/dev/null)
"
" Purpose: Option to delete text without adding to clipboard of any kind
vnoremap C "_d

" Normal mode: Run python on current file using F5
nmap <F5> :!clear; python3 %<CR>

" Description:
" Instead of using the black hole register, instead remap p to use the
" 'last used' register, which y (yank) will contribute to, but not d (delete)
"
" Purpose: Tried this but didn't work well for me
"nnoremap p "0p
" The problem to this second approach is that I am used to d putting it into
" the used register... I delete text and paste again to move stuff

" Commands Reference
" ---
" Supertab:
" Ctrl-p -> Go up one item in list (instead of arrow keys)
" Ctrl-n -> Go down one item in list (instead of array keys)
" New:
" diw -> Delete current word (better than wdb, no space at end)
" ciw -> Delete current word + Enter insert mode
" di" -> Delete within quotes ("delete in" quotes)
" di( -> Delete within parenthesis ("delete in" parens)
" :.! ls -> Insert output from command directly into vim
" gv -> Select last used visual selection
" ---
" D: delete from cursor to end of line (not including EOL)
" u: Undo
" Ctrl-r: Redo
" a: go into insert mode, one character to the right
" A: go into insert mode, at end of the line
" :set paste  -> turn paste on (better indentation formatting)
" :set paste! -> turn paste off
" :%s/word_to_remove/word_to_add/g -> Search and replace
" % -> While on bracket, brings to matching bracket
" Copy from vim to vim: select text, y (yank), shift-insert
" Copy from vim to clipboard: select text, shift-y, Ctrl-v
" Paste from clipboard to vim: select text, shift-p
" dd -> Delete current line (surprised how helpful this is)
" * Ctrl-O: Backwards to last spot looking at (best description...)
" * Ctrl-I: Fowards: opposite of to last spot
"
" Macros
"   q <name>:           start macro and give it a name
"   q:                  same key again to stop recording macro
"   <keys to replay>:   keys you want to to replay in the macro
"   @<name>:            Play the macro, by name
"
" Multi line comments in Python or Coffeescript
"   Ctrl-V:     Enter Visual Block where you'd like comments to start
"   j:          Go down until you reach where comments should end
"   Shift-i:    Begin insert mode for the comment characters
"   #:          Use # (or //, etc) to add comment to every line denoted by visual block
"   Escape:     When finished. Type `Escape Escape` to power through delay bug
"
" When opening a file that is read only because of permissions, can still save
" :w !sudo tee %


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

" Set max line length for certain types of files using autocmd
" autocmd BufRead,BufNewFile *.js *.coffee setlocal textwidth=90

filetype plugin indent on
syntax enable
