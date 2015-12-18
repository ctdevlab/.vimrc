set nocompatible
filetype off




" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

let g:ycm_confirm_extra_conf = 0

Plugin 'VundleVim/Vundle.vim'

" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/vundle'

" We could also add repositories with a ".git" extension
Plugin 'scrooloose/nerdtree.git'

" Tabular
Plugin 'godlygeek/tabular'

" Autocomplete
Plugin 'Valloric/YouCompleteMe'

" Auto close quotes, parens, brackets
Plugin 'raimondi/delimitmate'

" Multiple selection like Sublime Text
Plugin 'terryma/vim-multiple-cursors'

" Check syntax
Plugin 'scrooloose/syntastic'

" Airline status bar
Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" === Recommended settings for Syntastic ===
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" ======= END of recommended settings ======




" format
set autoindent
set backup
set nu
set smartindent
" set cindent
set autoindent
set showmatch
set textwidth=80
set title
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set pastetoggle=<F2>
set ruler
set incsearch
" enable high light search
set hlsearch
" set space to turn off highlighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

syntax enable 

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction


" support 256 colors in Lion terminal 
let g:solarized_termcolors=256
set t_Co=256

" files 

" ====== changed this due to Vundle configuration
" filetype on
" ======

filetype indent on
filetype plugin on
set omnifunc=syntaxcomplete#Complete
" always show file name
set modeline
set ls=2
set background=dark
" colorscheme
colorscheme solarized 
" backup
set backupdir=~/.vim/tmp
