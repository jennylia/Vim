version 6.0
" ===================================================================
" Structure of this file:
" Lines starting with an inverted comma (") are comments.
" Some mappings are commented out.Remove the comment to enable them.
"
" There are three kinds of things which are defined in this file:
" Mapping ("map"), settings ("set"), and abbreviations ("ab").
"Settings affect the behaviour of commands.
"Mappings maps a key sequence to a command.
"Abbreviations define words which are replaced
"right *after* they are typed in.
" ===================================================================

let bash_is_sh = 1
set shell=/bin/bash


"autowrite: Automatically save modifications to files
"when you use critical (rxternal) commands.
set autowrite
"
"backup:backups are for wimps;-)
set nobackup
"
"background:Are we using a "light" or "dark" background?
set background=dark 
"
"compatible:Let Vim behave like Vi?Hell, no!
set nocompatible

set showmatch

"
"cpoptions you should get to know - source of many FAQs!;-)
"cpoptions:"compatible options" to match Vi behaviour
" setcpoptions="aABceFs""default!
"FAQ:Do NOT include the flag '<' if you WANT angle notation!
"
"dictionary: english words first
"set dictionary=/usr/dict/words,/local/lib/german.words
"
"digraph:required for those umlauts
"set digraph
"
"errorbells: damn this beep!;-)
set noerrorbells

" visualbell:
set visualbell

"esckeys:allow usage of cursor keys within insert mode
set esckeys
"
"formatoptions:Options for the "text format" command ("gq")
"I need all those options (but 'o')!
"setformatoptions=cqrt
"
"helpheight: zero disables this.
set helpheight=0
"
"hidden:
set hidden
"
" highlight=8b,db,es,hs,mb,Mn,nu,rs,sr,tb,vr,ws
" set highlight=8r,db,es,hs,mb,Mr,nu,rs,sr,tb,vr,ws
"
"hlsearch :highlight search - show the current search pattern
"This is a nice feature sometimes - but it sure can get in the
"way sometimes when you edit.
set hlsearch
"
" icon:...
set noicon
"
" seticonstringfile of icon (Sven doesn't use an icon)
" seticonstring
"
"ignorecase:ignore the case in search patterns?NO!
set noignorecase
"
"insertmode:
" FAQ:Q: How can I quit insertmode when using this option?
"A: The option "insertmode" was not meant for "start Vim in
"insert mode" only; the idea is to *stay* in insert mode.
"Anyway, you can use the command |i_CTRL-O| to issue commands.
" set noinsertmode
"
"keywordprg:Program to use for the "K" command.
" set keywordprg=man\ -s
"
"laststatus:  show status line?Yes, always!
"laststatus:Even for only one buffer.
set laststatus=2
"
" [VIM5]lazyredraw:do not update screen while executing macros
set lazyredraw
"
"magic:use some magic in search patterns?Certainly!
set magic
"
"modeline:...
"Allow the last line to be a modeline - useful when
"the last line in sig gives the preferred textwidth for replies.
"set modeline
"set modelines=1
"
"number:...
set number
"
"path:The list of directories to search when you specify
"a file with an edit command.
"Note:"~/.P" is a symlink to my dir with www pages
""$VIM/syntax" is where the syntax files are.
"setpath=.,,~/.P/vim,~/.P/vim/syntax,~/.P/vim/source,$VIM/syntax/
"set path=.,../,../*/
"
"report: show a report when N lines were changed.
"report=0 thus means "show all changes"!
set report=0
"
"ruler:show cursor position?Yep!
set ruler
"
"shiftwidth:Number of spaces to use for each
"insertion of (auto)indent.
set shiftwidth=2
"
"shortmess:Kind of messages to show.Abbreviate them all!
"New since vim-5.0v: flag 'I' to suppress "intro message".
set shortmess=at
"
"showcmd:Show current uncompleted command?Absolutely!
set showcmd
"
"showmatch: Show the matching bracket for the last ')'?
set showmatch
"
"showmode:Show the current mode?YEEEEEEEEESSSSSSSSSSS!
set showmode
"
"suffixes:Ignore filename with any of these suffixes
"when using the ":edit" command.
"Most of these are files created by LaTeX.
set suffixes=.aux,.bak,.dvi,.gz,.idx,.log,.ps,.swp,.tar
"
"startofline:no:do not jump to first character with page "commands, ie keep the cursor in the current column.
set nostartofline
"
"tabstop
let curDir = matchstr($PWD, "wolf-int")
if curDir == "wolf-int"
  set tabstop=8
  set softtabstop=8
  set noexpandtab
else
  set ts=4
  set sts=4
  set sw=4
  set expandtab
endif"

set nocp

"textwidth
set textwidth=100
"
" Display the file name in the titlebat
set title
"
"ttyfast:are we using a fast terminal?
"seting depends on where I use Vim...
set ttyfast
"
"ttybuiltin:
set ttybuiltin
"
"ttyscroll:turn off scrolling -> faster! (on a slow connection)
set ttyscroll=999
"
"ttytype:
"set ttytype=builtin_xterm
"
"viminfo:What info to store from an editing session
"in the viminfo file;can be used at next session.
set viminfo=%,'50,\"100,:100,n~/.viminfo
"
"
"t_vb:terminal's visual bell - turned off to make Vim quiet!
"Please use this as to not annoy cow-orkers in the same room.
" Thankyou!:-)
"set t_vb=
"
"whichwrap:
"set whichwrap=<,>
"
"wildcharthe char used for "expansion" on the command line
"default value is "<C-E>" but I prefer the tab key:
set wildchar=<TAB>
"
"wrapmargin:
set wrapmargin=1
"
"writebackup:
set nowritebackup

filetype plugin on
"filetype indent on

set cindent

set backspace=indent,eol,start

map K <NUL>

"Toggles highlight searching
map <F5> :set hls!<bar>set hls?<CR>

noremap <Leader>r ggg?G`` 

map ,/ :s#^#//#<CR>
map ;/ :s#^//##<CR>

map ;pa :set paste<CR>
map ,pa :set nopaste<CR>


map ;v <ESC>:so ~/.vimrc<ESC>

map ,bgl :set background=light<CR>
map ,bgd :set background=dark<CR>

" smart tab completion
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction

vmap ;imp <ESC>`<ye:let classname=@@<C-M><ESC>`>
nnoremap ;imp BvE;imp

noremap ;<TAB> :0<CR>vG=
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

map ,a :0<CR>VG

" for syntax highlighting
" for color in xterm
syntax clear
syntax on

let os = system('uname')

" set the terminal info on Sun only.
if system('uname') == "SunOS\n"
  if has("terminfo")
    set t_Co=16
    set t_AF=[%?%p1%{8}%<%t3%p1%d%e%p1%{22}%+%d;1%;m
    set t_AB=[%?%p1%{8}%<%t4%p1%d%e%p1%{32}%+%d;1%;m
    set t_Sf=[3%dm
    set t_Sb=[4%dm
  else
    set t_Co=16
    set t_Sf=m
    set t_Sb=m
  endif
endif

set makeprg=jc\ % 
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%# 

"set splitright
set ic

set tags=./tags,./../tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags,./../../../../../../tags,./../../../../../../../tags,./../../../../../../../../tags,./../../../../../../../../../tags,./../../../../../../../../../../tags,./../../../../../../../../../../../tags,./../../../../../../../../../../../../tags,./../../../../../../../../../../../../../tags,./../../../../../../../../../../../../../../tags,./../../../../../../../../../../../../../../../tags,./../../../../../../../../../../../../../../../../tags,./../../../../../../../../../../../../../../../../../tags,./../../../../../../../../../../../../../../../../../../tags,tags

highlight EOLWS ctermbg=red guibg=red
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/

set list
set listchars=tab:»·,trail:·

colorscheme github
" set nocscopeverbose
"

if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    "if filereadable("cscope.out")
       " cs add cscope.out  
    " else add the database pointed to by environment variable 
"    elseif $CSCOPE_DB != ""
 "       cs add $CSCOPE_DB
    "endif

    " show msg when any other cscope db added
    set cscopeverbose  


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    map <C-\> :cs find s <C-R>=expand("<cword>")<CR><CR>	
    map <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    map <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    map <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    map <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    map <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    map <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    map <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	
   " map <F2>    :cs find s <C-R>=expand("<cword>")<CR><CR>
    map <F2>    :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    map <F3> :NERDTree<CR>
     " Hitting CTRL-space *twice* before the search type does a vertical·
" split instead of a horizontal one (vim 6 and up only)
"
" (Note: you may wish to put a 'set splitright' in your .vimrc
" if you prefer the new window on the right instead of the left

map <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
map <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
map <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
map <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
map <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
map <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>»··
map <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>»
map <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


""""""""""""" key map timeouts
"
" By default Vim will only wait 1 second for each keystroke in a mapping.
" You may find that too short with the above typemaps.  If so, you should
" either turn off mapping timeouts via 'notimeout'.
"
"set notimeout·
"
" Or, you can keep timeouts, by uncommenting the timeoutlen line below,
" with your own personal favorite value (in milliseconds):
"
"set timeoutlen=4000
"
" Either way, since mapping timeout settings by default also set the
" timeouts for multicharacter 'keys codes' (like <F1>), you should also
" set ttimeout and ttimeoutlen: otherwise, you will experience strange
" delays as vim waits for a keystroke after you hit ESC (it will be
" waiting to see if the ESC is actually part of a key code like <F1>).
"
"set ttimeout·
"
" personally, I find a tenth of a second to work well for key code
" timeouts. If you experience problems and have a slow terminal or network
" connection, set it higher.  If you don't set ttimeoutlen, the value for
" timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
"
"set ttimeoutlen=100

endif

set mouse=a
set runtimepath^=~/.vim/bundle/ctrlp.vim
