" Aaron's Global Defaults


" Bundle Plugins!
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Vundle stuff
Bundle 'kien/ctrlp.vim'
Bundle 'aaronzirbes/grails-vim.git'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/ZoomWin'
Bundle 'vim-scripts/taglist.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'gregsexton/gitv'
Bundle 'Shougo/neocomplcache.git'
Bundle 'Shougo/neosnippet.git'
Bundle 'freitass/todo.txt-vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'sjurgemeyer/vim-grails-import'
Bundle 'tpope/vim-abolish.git'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'vim-scripts/Align.git'
Bundle 'derekwyatt/vim-scala'

" Maybe plugins
"Bundle 'mhinz/vim-startify'
"Bundle 'jeetsukumaran/vim-buffergator.git'
"Bundle 'sjl/gundo.vim.git'

" tagbar support for groovy
 let g:tagbar_type_groovy = {
 \ 'ctagstype' : 'groovy',
 \ 'kinds' : [
     \ 'p:package',
     \ 'c:class',
     \ 'i:interface',
     \ 'f:function',
     \ 'v:variables',
     \ ]
 \ }

" After updating this list, run `vim +BundleInstall +qall`

filetype plugin indent on

" I like pretty colors
if has("syntax")
  syntax on
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" Ctrl-P ignore path
set wildignore+=*.class,.git,.hg,.svn,**/target/classes/**,**/target/test-classes/**,**/target/test-reports/**.html,**/target/test-reports/**.xml,**/build/**

" Exhuberant C-Tags
set tags=.tags

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd     " Show (partial) command in status line.
set showmatch       " Show matching brackets.
"set ignorecase smartcase    " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
"set autowrite      " Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a        " Enable mouse usage (all modes)
" Set the current line with the cursor on it to have an underline
set cursorline
set cmdheight=2
" When switching buffers, swap for the current open window
"set switchbuf=useopen
"
" Turn on line numbers
set number
set numberwidth=5

" Always show cursor information
set ruler
"%{fugitive#statusline()} to 'statusline'

" Whether or not to show the tabs list
"set showtabline=2

"
" COMMENT THESE OUT TO LET VIM WINDOWS BE THE DEFAULT SIZE
set winwidth=130
set winminwidth=12
set winheight=25
set winminheight=5
au VimEnter * set winheight=999

" The number of lines before and after the cursor to show
set scrolloff=3

let mapleader=","

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Search highlighting
set hlsearch
function! MapCr()
    nnoremap \ :nohlsearch<CR>
endfunction
call MapCr()

" My Settings
set expandtab
set tabstop=4
set shiftwidth=4
set laststatus=2
" colorscheme torte
colorscheme koehler

" Vertical Column Limiter
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%121v.\+/
set colorcolumn=121
highlight ColorColumn ctermbg=2

" ctags
command! Tag :call GenerateCTags()
function! GenerateCTags() 
	let file = expand("%:p:h")
	execute ":!ctags -f " . file . "/.tags " . file . "/*"
endfunction

" Spell check my stuff
"set spell spelllang=en_us

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Split line
nnoremap L i<CR><Esc>

" Grails Imports location
let g:grails_import_list_file=$HOME . '/.vim/grails-import-list.txt'

" vimdiff ignore whitespace
set diffopt+=iwhite

" Fugitive
noremap <Leader>b :<C-U>Gblame<CR>
noremap <Leader>di :<C-U>Gdiff<CR>
noremap <Leader>dd :<C-U>Gvsplit develop:<C-R>=expand("%")<CR><CR>
noremap <Leader>s :<C-U>Gstatus<CR><C-W>20+
noremap <Leader>h :<C-U>Gbrowse<CR>
vnoremap <Leader>h :<C-U>Gbrowse<CR>
noremap <Leader>c :<C-U>Gcommit<CR>
noremap <Leader>d :<C-U>Gdiff<CR>
" Gitv
noremap <Leader>l :<C-U>Gitv!<CR>
noremap <Leader>L :<C-U>Gitv<CR>
" nertree
noremap <Leader>nt :<C-U>NERDTreeToggle<CR>
noremap <Leader>nf :<C-U>NERDTreeFind<CR>
" tagbar
noremap <Leader>t :<C-U>TagbarToggle<CR>
" Jira https://gist.github.com/2d860441b323e543d2bc

" Groovy / Java find uses
noremap <Leader>fu :<C-U>grep --include '*.groovy' --include '*.gsp' --include '*.gradle' -rE "\<<C-R>=expand("<cword>") <CR>\>" .<CR>:copen<CR>

" Dispatch code execution
noremap <Leader>rg :<C-U>Dispatch groovy '<C-R>=expand("%:p") <CR>'<CR>
noremap <Leader>rr :<C-U>Dispatch ~/.vim/grails-gradle-test.sh '<C-R>=expand("%:t:r") <CR>'<CR>
"noremap <Leader>rt :<C-U>Dispatch grails test-app -Duser.timezone=UTC unit: '<C-R>=expand("%:t:r") <CR>'<CR>
"noremap <Leader>rr :<C-U>Dispatch grails test-app -Duser.timezone=UTC integration: '<C-R>=expand("%:t:r") <CR>'<CR>
noremap <Leader>rb :<C-U>Dispatch gradle build<CR>

noremap <Leader>j :<C-U>!jira<CR> <CR>
" Enable Spell check highting for buffer
noremap <Leader>sp :<C-U>set spell spelllang=en_us<CR>
noremap <Leader>so :<C-U>set spell spelllang=<CR>

" Copy selected range to Mac OS X copy buffer
vnoremap <Leader>y :<C-U>!sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p '<C-R>=expand("%:p") <CR>' \|pbcopy <CR> <CR>
" Copy entire file contents to Mac OS X copy buffer
nnoremap <Leader>y :<C-U>!cat '<C-R>=expand("%:p") <CR>' \| pbcopy <CR> <CR>

" JSON hilighting
au BufRead,BufNewFile *.json set filetype=json

