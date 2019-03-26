set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" File Management
Plugin 'kien/ctrlp.vim'
Plugin 'DavidEGx/ctrlp-smarttabs'
Plugin 'scrooloose/nerdtree'

" Utility plugins
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'Townk/vim-autoclose'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'easymotion/vim-easymotion'
Plugin 'Valloric/YouCompleteMe'

" Writing
Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-markdown'
Plugin 'reedes/vim-lexical'

" Golang
Plugin 'fatih/vim-go'
let g:go_version_warning = 0

" Typescript
Plugin 'leafgarland/typescript-vim'

" Ruby
Plugin 'vim-ruby/vim-ruby'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'L9'
Plugin 'airblade/vim-gitgutter'
Plugin 'tomasr/molokai'
" Better Statusline
Plugin 'bling/vim-airline'

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

" Persistent Undo
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

set smarttab
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

let mapleader = ","
" Setup our beautiful statusline
"let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'

" Fix vim-autoclose and YouCompleteMe not playing nice together
let g:AutoClosePumvisible = {"ENTER": "", "ESC": ""}

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

" Tagbar for go
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" Go syntax highlighting
let g:go_highlight_types = 1

" Auto-add and remove imports on save
let g:go_fmt_command = "goimports"

" Always append periods to comments in go
autocmd BufWritePre *.go :%s/^\(\s*\)\/\/\(.*[^.?!,]\)$/\1\/\/\2./e

" Better java syntax highlighting
let g:syntastic_mode_map = {
  \ "mode": "active",
  \ "passive_filetypes": ["java"] }

" YCM language semantic support
  let g:ycm_semantic_triggers =  {
    \   'c': ['->', '.'],
    \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
    \            're!\[.*\]\s'],
    \   'ocaml': ['.', '#'],
    \   'cpp,cuda,objcpp': ['->', '.', '::'],
    \   'perl': ['->'],
    \   'php': ['->', '::'],
    \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
    \   'java,jsp' : ['.'],
    \   'ruby,rust': ['.', '::'],
    \   'lua': ['.', ':'],
    \   'erlang': [':'],
    \ }

" Enable triggering completion easily
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

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
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" Open NERDTree if vim was invoked without a file
autocmd StdinReadPre * let:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

syntax enable

filetype plugin indent on

set wildmenu
set wildmode=list:longest

set backspace=indent,eol,start

set t_ut=

colorscheme molokai
