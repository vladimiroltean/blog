" Break compatibility with vi
set nocp

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

" Maintain persistent undo history of files
set undofile
" For files edited outside of vim
set autoread
" Search options
set incsearch
set smartcase
set hlsearch
set nowrapscan
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

set tags=./tags.headers;/,./tags;/,tags;/;


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
" Custom functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Downloaded from
" github.com/gotbletu/shownotes/blob/master/mlocate_vdiscover_vim_locate.txt

" credits
" http://vim.wikia.com/wiki/Open_a_web-browser_with_the_URL_in_the_current_line
" section 41.6 using functions http://vimdoc.sourceforge.net/htmldoc/usr_41.html
" devnull https://code.google.com/p/vimwiki/issues/detail?id=401
" put qoutes around line http://stackoverflow.com/a/3218805
" bypass pressing Enter to continue with extra <CR> http://stackoverflow.com/a/890831

function! OpenCurrentLine ()
  " grab current line
  let line = getline (".")
  " add qoutes around the current line to avoid spaces/symbols issues
  let line = substitute(line, '^\(.*\)$', '"\1"', "g")
  " open with default system app, no messy output msg
  exec "!xdg-open" line '>&/dev/null &'
endfunction



" If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0
    return
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction

" NERDTree utility function
function s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif
endfunction



augroup AuNERDTreeCmd
	autocmd AuNERDTreeCmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
	autocmd AuNERDTreeCmd FocusGained * echom 'FocusGained' "call s:UpdateNERDTree()
augroup END

