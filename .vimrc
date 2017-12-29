" Pathogen load
"filetype off
"
"call pathogen#infect()
"call pathogen#helptags()

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

if !empty(glob("~/.vim/autoload/plug.vim"))
    call plug#begin()
        Plug 'flazz/vim-colorschemes' | Plug 'altercation/vim-colors-solarized'
        Plug 'arcticicestudio/nord-vim'
        Plug 'whatyouhide/vim-gotham'
        Plug 'vim-airline/vim-airline'
"         Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
        Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
        Plug 'klen/python-mode', { 'for': 'python' }
        Plug 'davidhalter/jedi-vim', { 'for': 'python' }
        Plug 'scrooloose/syntastic'
        Plug 'tpope/vim-fugitive'
        Plug 'fatih/vim-go', { 'for': 'go' }
        Plug 'rodjek/vim-puppet', { 'for': 'puppet' }
        Plug 'Rykka/riv.vim', { 'for': 'rst' }
        Plug 'rust-lang/rust.vim', { 'for': 'rust' }
        Plug 'timonv/vim-cargo'
        Plug 'racer-rust/vim-racer', { 'for': 'rust' }
        Plug 'hashivim/vim-terraform'
        Plug 'cespare/vim-toml'
        Plug 'tpope/vim-unimpaired'
    call plug#end()
endif




" ---- Color Customization ----

" Color scheme and font

" colorscheme nord

" colorscheme xoria256

" colorscheme desert

" colorscheme gotham

" colorscheme solarized
" if has('gui_running')
"     set background=light
" else
"     set background=dark
" endif
" let g:solarized_termcolors=16

" Recommended config for powerline - no difference though
" set guifont=Inconsolata\ for\ Powerline:h15
"let g:Powerline_symbols = 'fancy'
"set encoding=utf-8
"set t_Co=256
"set fillchars+=stl:\ ,stlnc:\
" set term=xterm-256color
"set termencoding=utf-8

" Allow color schemes to do bright colors without forcing bold.
"if &t_Co == 8 && $TERM !~# '^linux'
"	set t_Co=16
"endif

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

" let g:pymode_lint_ignore = 'E226,E262,E261,E126,E501,E701,E731,E301,E302,E128,W191,W0312,C901'
" let g:syntastic_mode_map = { 'passive_filetypes': ['python'] } " deactivate syntastic for python files since pymode
let g:pymode_lint = 0 " deactivate pymode lint checking because syntastic
let g:syntastic_python_flake8_args = '--ignore=E226,E262,E261,E126,E501,E701,E731,E301,E302,E128,W191,W0312,C901'
let g:syntastic_python_checkers = ['python', 'flake8']
let g:syntastic_always_populate_loc_list = 1 " refresh the error list automatocally instead of typing :Errors
let g:syntastic_auto_loc_list = 1 " open the error list automatically instead of using :Errors
" let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck'] " fix vim lagging when closing go files
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] } " fix vim lagging when closing go files
let g:pymode_rope = 0 " disable pymode rope autocompletion due to bug, use jedi-vim instead
let g:jedi#use_tabs_not_buffers = 1 " jedi-vim go to definition open tab <leader>d
let g:go_list_type = "quickfix" " fix the location list window that contains the output of commands such as :GoBuild and :GoTest not appearing
let g:rustfmt_autosave = 1 "enable auto-formatting on saving for rust
let g:racer_cmd = "$HOME/.cargo/bin/racer"
let g:racer_experimental_completer = 1

map <C-n> :NERDTreeToggle<CR>

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap gm <Plug>(rust-doc)
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>
