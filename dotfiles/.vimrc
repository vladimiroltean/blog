set nocp
" Break compatibility with vi

set shortmess=a
source ~/.vimrc.functions
source ~/.vimrc.plug
source ~/.vimrc.keymaps

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic stuff to make the thing usable, shouldn't need to edit these
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Create backup folder if it doesn't exist
let s:vim_cache = expand('$HOME/.vim/_backup')
if filewritable(s:vim_cache) == 0 && exists("*mkdir")
    call mkdir(s:vim_cache, "p", 0700)
endif

let &backupdir=s:vim_cache
let &undodir=s:vim_cache
let &dir=s:vim_cache

" Maintain persistent undo history of files
set undofile
" For files edited outside of vim
set autoread
" Search options
set incsearch
set ignorecase
set smartcase
set hlsearch
set wrapscan
set mousemodel=extend
" scroll offset from the cursor to the top and bottom
set scrolloff=7
set ruler
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set encoding=utf8
" Show autocompletion menu for command mode
set wildmenu
" Mark tabs and spaces.
set list listchars=tab:»\ ,trail:·,extends:»,precedes:«
" Load manual pages.
runtime ftplugin/man.vim
" Set tex flavor.
let g:tex_flavor = 'latex'
" For yank to use " register and work with X11 clipboard
set clipboard=unnamedplus
set guioptions+=a
" For better tmux compatibility (mouse scrolling)
set mouse=a
set term=xterm-256color
" For mouse clicks beyond column 220
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

"set foldmethod=syntax
set tags=./tags.headers;/,./tags;/,tags;/;
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocscopeverbose " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set cscopeverbose
    endif
endfunction
au BufEnter /* call LoadCscope()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" De gustibus non disputandum
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
"set relativenumber

" Indent with tabs, align with spaces
set tabstop=8
set shiftwidth=8
set softtabstop=0
"set smarttab
set noexpandtab
set preserveindent
set copyindent
set autoindent
"set smartindent
"set cindent

"set textwidth=80
set wrap
"set list breaks this
set linebreak

" Colorscheme
" Use "bluegreen" for now, previously was using "molokai"
colorscheme bluegreen
" Repair colors for completion menu
highlight Pmenu ctermbg=238 ctermfg=cyan gui=bold

" Make vim use nice colors
"set background = "dark"
" Disable opaque background
"highlight Normal    ctermbg=none
"highlight NonText   ctermbg=none
"highlight VertSplit ctermbg=none
"highlight LineNr    ctermbg=none
"highlight Special   ctermbg=none
set wildmenu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Taken from Janus
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("statusline") && !&cp
  hi User0 cterm=bold ctermfg=black ctermbg=white
  hi User1 cterm=bold ctermfg=red   ctermbg=none
  hi User2 cterm=bold ctermfg=white ctermbg=none
  hi User3 cterm=bold ctermfg=green ctermbg=none
  hi User4 cterm=bold ctermfg=cyan  ctermbg=none

  set laststatus=2  " always show the status bar

  " Start the status line
  set statusline=
  set statusline+=%0*                           " User0 highlight
  set statusline+=%t\ %m\ %r                    " Tail of filename, Modified flag, Read-only
  set statusline+=%4*                           " User4 highlight
  set statusline+=\ %y                          " File Type
  set statusline+=%2*                           " User2 highlight
  set statusline+=\ Line\ %3l\ of\ %L\ [%3p%%]
  set statusline+=\ Col%3v
  set statusline+=%1*                           " User1 highlight
  set statusline+=\ %{fugitive#statusline()}
  set statusline+=%0*                           " Return to User0 highlight

endif


filetype plugin indent on " Turn on filetype plugins (:help filetype-plugin)

if has("autocmd")
  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make setlocal noexpandtab

  " Make sure all markdown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
  if !exists("g:disable_markdown_autostyle")
    au FileType markdown setlocal wrap linebreak textwidth=72 nolist
  endif

  " make Python follow PEP8 for whitespace ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python setlocal tabstop=4 shiftwidth=4

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

