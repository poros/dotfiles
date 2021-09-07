" remember to brew install vim and restart shell

" Load Vundle
if empty(glob("~/.vim/bundle/Vundle.vim"))
    execute '!mkdir -p ~/.vim/bundle'
    execute '!git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
endif

set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'whatyouhide/vim-gotham'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'rodjek/vim-puppet'
Plugin 'Rykka/riv.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'timonv/vim-cargo'
Plugin 'hashivim/vim-terraform'
Plugin 'cespare/vim-toml'
Plugin 'junegunn/fzf'
Plugin 'klen/python-mode'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'fatih/vim-go'
call vundle#end()            " required
filetype plugin indent on    " required

" Install YouCompleteMe (aka YCM)
if (!empty(glob("~/.vim/bundle/YouCompleteMe/CONTRIBUTING.md")) && empty(glob("~/.vim/bundle/YouCompleteMe/END_SETUP")))
    execute '!cd ~/.vim/bundle/YouCompleteMe && python3 install.py --go-completer --java-completer --rust-completer && touch END_SETUP && cd ~'
endif

" ---- Color Customization ----

" Color scheme and font

" colorscheme nord

" colorscheme xoria256

" colorscheme desert

colorscheme gotham256

" colorscheme solarized
" if has('gui_running')
"     set background=light
" else
"     set background=dark
" endif
" let g:solarized_termcolors=16

" Recommended config for powerline - no difference though
" set guifont=Inconsolata\ for\ Powerline:h15
" let g:Powerline_symbols = 'fancy'
" set encoding=utf-8
" set t_Co=256
" set fillchars+=stl:\ ,stlnc:\
" set term=xterm-256color
" set termencoding=utf-8
"
"  Allow color schemes to do bright colors without forcing bold.
" if &t_Co == 8 && $TERM !~# '^linux'
" 	set t_Co=16
" endif

" Configuration for vim-airline
let g:airline_powerline_fonts = 1
" if xterm was set correctly, these would probably not be needed
set t_Co=256
set term=xterm-256color


augroup highlights
	" Highlight trailing whitespace and non-tab indents.
	autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
	autocmd BufWinEnter *.* match ExtraWhitespace /\s\+$/
	autocmd BufWinLeave * call clearmatches()

	" Show extra whitespace
	hi ExtraWhitespace guibg=#666666
	hi ExtraWhitespace ctermbg=7
	match ExtraWhitespace /\s\+$/
	autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
	autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
	autocmd InsertLeave * match ExtraWhitespace /\s\+$/
	autocmd BufWinLeave * call clearmatches()

	" Put line numbers more in the background visually.
	autocmd ColorScheme * highlight LineNr ctermfg=darkgrey guifg=darkgrey
	" Highlight part of lines longer than 80 characters, like this one.
	" autocmd ColorScheme * highlight OverLength ctermbg=black ctermfg=white guibg=#592929
	" autocmd BufWinEnter * match OverLength /\%80v.\+/
	" autocmd InsertEnter * match OverLength /\%80v.\+/
	" autocmd InsertLeave * match OverLength /\%80v.\+/
augroup END


filetype plugin indent on
syntax on 

set hlsearch
set modeline

" Style
set visualbell		      " Visual Bell instead of beep.
set number			      " Show line numbers.
set cursorline		      " Highlight current line
set scrolloff=3		      " Show 3 lines above/below cursor, ie: zt & zb.
set showcmd               " Show description of command you are using
set display+=lastline     " Show as much as possible of last line instead of @
set fileformats+=mac      " Show mac formatted files
if &listchars ==# 'eol:$' " Show suspicious characters
	set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
if &tabpagemax < 50       " Set max number of tabs
	set tabpagemax=50
endif
" " Style => Tab completion
set wildmenu		" Enhanced Tab Completion for wildmode.
set wildmode=longest:list
set wildignore=*.pyc
" " Style => Search
set ignorecase		" Search ignores case,
set smartcase		" unless search terms contains capitals.
set incsearch		" Incremental search 40, 30
if maparg('<C-L>', 'n') ==# '' " Use <C-L> to clear the highlighting of :set hlsearch
	nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif
" " Input => Mouse
set mouse=a			" Enabled for all modes.
" " Input => Tab Char
set autoindent		" Copy indent from curr line when creating new line.
set tabstop=4		" Tab counts for 4 spaces.
set softtabstop=4	" == tabstop ? Prevent forest fires : mix tab+spaces.
set shiftwidth=4	" Shift text 4 spaces.
set nosmarttab		" Use tabstop for all tabbing.
set expandtab       " Expand tans to spaces
" " Input => Backspace & Left/Right Movement
set backspace=eol,start,indent
set whichwrap=b,s,h,l,<,>,[,]
" " Input => less delay after esc in insert mode
set ttimeout
set ttimeoutlen=100

set sessionoptions-=options " Don't persist options and mappings because can corrupt a session

set laststatus=2 " powerline shows up also without splits

let g:pymode_folding = 1 " activate folding for pymode
let g:pymode_virtualenv = 1 " let pymode look into virtualenv
let g:pymode_options_max_line_length = 120 " sidebar is at column X

" let g:pymode_lint_ignore = 'E226,E262,E261,E126,E501,E701,E731,E301,E302,E128,W191,W0312,C901'
" let g:syntastic_mode_map = { 'passive_filetypes': ['python'] } " deactivate syntastic for python files since pymode
let g:pymode_lint = 0 " deactivate pymode lint checking because syntastic
let g:syntastic_python_flake8_args = '--ignore=E226,E262,E261,E126,E501,E701,E731,E301,E302,E128,W191,W0312,C901'
let g:syntastic_python_checkers = ['python', 'flake8']
let g:syntastic_always_populate_loc_list = 1 " refresh the error list automatocally instead of typing :Errors
let g:syntastic_auto_loc_list = 1 " open the error list automatically instead of using :Errors
let g:syntastic_go_checkers = ['gofmt', 'golint', 'govet', 'errcheck'] " fix vim lagging when closing go files
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] } " fix vim lagging when closing go files
let g:pymode_rope = 0 " disable pymode rope autocompletion due to bug, use jedi-vim instead
let g:go_list_type = "quickfix" " fix the location list window that contains the output of commands such as :GoBuild and :GoTest not appearing
let g:rustfmt_autosave = 1 "enable auto-formatting on saving for rust
let g:syntastic_sh_checkers = ['sh'] "shellcheck seems to be broken on devboxes

map <C-n> :NERDTreeToggle<CR>

let mapleader=","
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>do :YcmCompleter GetDoc<CR>
nnoremap <leader>fi :YcmCompleter FixIt<CR>
