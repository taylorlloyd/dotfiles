set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'airblade/vim-gitgutter'
Plugin 'tomasr/molokai'
" Add autocompletion
Plugin 'Valloric/YouCompleteMe'
" Better Statusline
Plugin 'bling/vim-airline'
" File management
Plugin 'kien/ctrlp.vim'
Plugin 'DavidEGx/ctrlp-smarttabs'
" Easy to match parenthesis
Plugin 'kien/rainbow_parentheses.vim'

"Scala Syntax highlighting
Plugin 'derekwyatt/vim-scala'

" I just discovered CTags. I feel like I've been living under a rock
Plugin 'majutsushi/tagbar'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" It's ridiculous not to show line numbers by default
set number
set autoread

" swp files stay away from my git
set backupdir=~/.vim/backup
set directory=~/.vim/backupf

set smarttab
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

let mapleader = ","
" Setup our beautiful statusline
"let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'

set laststatus=2

" Show Buffer Tabs
let g:airline#extensions#tabline#enabled = 1

" Parentheses colors
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Let's learn not to use dem arrow keys
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Keyboard Tab management
nnoremap <Leader><Space> :CtrlPMixed<CR>
nnoremap <Leader>t :CtrlPTag<CR>
nnoremap <Leader>b :TagbarToggle<CR>

" Clean up trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

syntax enable

filetype plugin indent on

set wildmenu
set wildmode=list:longest

set backspace=indent,eol,start

colorscheme molokai
