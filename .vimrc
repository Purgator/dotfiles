set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" My plugins
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tmhedberg/matchit'
Plugin 'ervandew/supertab'
Plugin 'AndrewRadev/switch.vim'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-commentary'
Plugin 'zhou13/vim-easyescape'

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


"let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_auto_trigger=1
"let g:ycm_server_python_interpreter='/usr/bin/python2'

set number
syntax on
set wildmenu
set wildmode =list:longest,list:full
set cursorline
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set showcmd
set mouse=a
set ignorecase
set smartcase
set scrolloff=5

" Change directory when open a file
" set autochdir

" Use same clipboard as selection system clipboard ('*' in vim)
set clipboard=unnamed

" Set map leader
let mapleader=","

" i let vim read my aliases. I have no idea what is the meaning of all this shit
if &diff == 'nodiff'
	set shellcmdflag=-ci
endif

" Don't wrap around to the beggining when searching next match
set nowrapscan

" Disable horizontal scroll, wrap text outside the screen below the line
set wrap

" Fold
set foldmethod=manual
set foldcolumn=1

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Cut without affecting any buffer
nnoremap <leader>d "_d
nnoremap <leader>dd "_dd
nnoremap <leader>dit "_dit
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

" Use <F3> to toggle between 'nu' and 'nonu'
noremap <F3> :set invnumber<CR>
inoremap <F3> <C-O>:set invnumber<CR>

" Use <F4> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F4>

" Use <F5> to remove all non desired whitespaces
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" <Ctrl-L> redraws the screen and removes any search highlighting.
nnoremap <C-L> :nohl<CR><C-L>"

" kj or jk leaves insert mode
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 130
cnoremap jk <ESC>
cnoremap kj <ESC>

" Enter in normal mode add a new line
nmap <Enter> o<Esc>

" Space insert space in normal mode as in insert mode
nnoremap space i<space><esc>

" Print current date
nnoremap <C-P><C-D> :exe "normal o" . strftime("'%F %T'")<CR>

" Compare 2 dates
nnoremap <C-P><C-M> :.,+1w !xargs datediff --format='\%M:\%S mn'<CR>

" Middle clic paste at mouse position
inoremap <MiddleMouse> <LeftMouse><MiddleMouse>

" Ctrl-b moves cursor at last position
noremap <C-b> ``

" TODO: Remap C-h C-j C-k C-l as pg up/down etc


" highlight search
set hlsearch

" Spell check
"set spelllang =fr
"set spell
"set spellsuggest =5

" Set PKGBUILD to PKGBUILD
"augroup pkgbuild
"    autocmd!
"    autocmd BufRead,BufNewFile PKGBUILD set filetype=PKGBUILD
"augroup END


" change colour scheme
"colorscheme murphy
colorscheme solarized
set background=dark


" Powerline support
" Use python 3.6
let $PYTHONPATH='/usr/lib/python3.6/site-packages'

" Always show statusline
set laststatus=2


" Prevent matchit plugin to jump from <ol> to <li>
autocmd FileType html let b:match_words='<:>,<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'

" cursor memory
if has("autocmd")
	filetype plugin indent on
	autocmd FileType text setlocal textwidth=78

	autocmd BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\   exe "normal g`\"" |
				\ endif
endif


" View autoload
let g:skipview_files = [
            \ '[EXAMPLE PLUGIN BUFFER]'
            \ ]
function! MakeViewCheck()
    if has('quickfix') && &buftype =~ 'nofile'
        " Buffer is marked as not a file
        return 0
    endif
    if empty(glob(expand('%:p')))
        " File does not exist on disk
        return 0
    endif
"    if len($TEMP) && expand('%:p:h') == $TEMP
"        " We're in a temp dir
"        return 0
"    endif
"    if len($TMP) && expand('%:p:h') == $TMP
"        " Also in temp dir
"        return 0
"    endif
    if index(g:skipview_files, expand('%')) >= 0
        " File is in skip list
        return 0
    endif
    return 1
endfunction
augroup vimrcAutoView
    autocmd!
    " Autosave & Load Views.
    autocmd BufWinLeave,BufWritePost,BufLeave,WinLeave ?* if MakeViewCheck() | mkview | endif
    autocmd BufWinEnter ?* if MakeViewCheck() | silent loadview | endif
augroup end




" # Function to permanently delete views created by 'mkview'
function! MyDeleteView()
    let path = fnamemodify(bufname('%'),':p')
    " vim's odd =~ escaping for /
    let path = substitute(path, '=', '==', 'g')
    if empty($HOME)
    else
        let path = substitute(path, '^'.$HOME, '\~', '')
    endif
    let path = substitute(path, '/', '=+', 'g') . '='
    " view directory
    let path = &viewdir.'/'.path
    call delete(path)
    echo "Deleted: ".path
endfunction

" # Command Delview (and it's abbreviation 'delview')
command! Delview call MyDeleteView()
" Lower-case user commands: http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
cabbrev delview <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Delview' : 'delview')<CR>

" Delete view and reload file
function! DeleteViewAndReload()
	call MyDeleteView()
	edit
endfunction

" Command Delviewreload
command! Delviewreload call DeleteViewAndReload()

" # Function close all brackets
function! CloseAllBrackets()
	"search('{','We')
	"/"\v\(\) \{"
	echo "Write in Progress"
endfunction

" Command ClsBrackets
command! ClsBrackets call CloseAllBrackets()

" Save current file as root without reloading the file
function! SaveAsRoot()
	w !sudo tee % > /dev/null
endfunction

command! W call SaveAsRoot()

" Reload vimrc file without leaving the current file editing
if !exists("*ReloadVimrc")
	function ReloadVimrc()
		source ~/.vimrc
	endfunction
endif

command! Reloadvimrc call ReloadVimrc()



" NeoVim section
set rtp^=/usr/share/vim/vimfiles/
if has('nvim')
	set inccommand=split
endif


" TODO:
" Add date formats to speeddating. See
" https://github.com/tpope/vim-speeddating/blob/master/plugin/speeddating.vim
" maybe do a pull request or fork it
