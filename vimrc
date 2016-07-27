execute pathogen#infect()
syntax on
filetype plugin indent on


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
"Plugin 'tpope/vim-fugitive'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'tpope/vim-rails.git'
Bundle 'taglist.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle "kien/ctrlp.vim"
Bundle 'scrooloose/nerdtree'
"Bundle 'vim-scripts/TagHighlight.git'
"Bundle 'vim-scripts/SrcExpl'
Bundle "vim-scripts/c.vim"
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"Plugin 'FuzzyFinder'
" scripts not on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required
"Bundle 'Valloric/YouCompleteMe'

syntax on
filetype plugin indent on
set nu
set nocompatible
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
%ret!
set cindent
set autoindent
set hlsearch
set incsearch
set tags=tags;
set autochdir
set ruler
set noswapfile
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWindowLayout='FileExplorer'
let g:persistentBehaviour=0
let g:winManagerWidth = 30
let g:AutoOpenWinManager = 1
nnoremap wm :WMToggle<CR>
let Tlist_Auto_Open=1
let Tlist_Use_Right_Window=0
let Tlist_WinWidth=50
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=0
let Tlist_Show_One_File = 1
set ut=500
nnoremap tl :Tlist<CR>
colorscheme mycolor
set t_kb=
set backspace=2
set list
set t_Co=256
set listchars=tab:>-,trail:-
"autocmd FileType c,cpp set shiftwidth=2| set expandtab
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
set cc=75
inoremap jj <ESC>
set mouse=
set timeoutlen=1000 ttimeoutlen=30

nnoremap fq :qall<CR>
nnoremap fw :wqall<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting start
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  elseif $ANDROID_BUILD_TOP != ""
    cs add $ANDROID_BUILD_TOP . "/cscope.out"
  endif
  set csverb
endif

function! CscopeFinds()
  set cscopequickfix=s-
  exe 'cs find s ' . expand("<cword>")
endfunction
function! CscopeFindg()
  set cscopequickfix=g-
  exe 'cs find g ' . expand("<cword>")
endfunction
function! CscopeFindc()
  set cscopequickfix=c-
  exe 'cs find c ' . expand("<cword>")
endfunction
function! CscopeFindt()
  set cscopequickfix=t-
  exe 'cs find t ' . expand("<cword>")
endfunction
function! CscopeFinde()
  set cscopequickfix=e-
  exe 'cs find e ' . expand("<cword>")
endfunction
function! CscopeFindf()
  set cscopequickfix=f-
  exe 'cs find f ' . expand("<cword>")
endfunction
function! CscopeFindi()
  set cscopequickfix=i-
  exe 'cs find i ' . expand("<cword>")
endfunction
function! CscopeFindd()
  set cscopequickfix=d-
  exe 'cs find d ' . expand("<cword>")
  bo vert cw 60
endfunction

nnoremap <C-_>s :call CscopeFinds() <CR>
nnoremap <C-_>g :call CscopeFindg() <CR>
nnoremap <C-_>c :call CscopeFindc() <CR>
nnoremap <C-_>t :call CscopeFindt() <CR>
nnoremap <C-_>e :call CscopeFinde() <CR>
nnoremap <C-_>f :call CscopeFindf() <CR>
nnoremap <C-_>i :call CscopeFindi() <CR>
nnoremap <C-_>d :call CscopeFindd() <CR>

nnoremap cp :cp<CR>
nnoremap cn :cn<CR>
nnoremap co :bo vert cw 60<CR>
nnoremap cw :bo vert cw 60<CR>
nnoremap cl :cclose<CR>
"set cscopequickfix=s-,c-,d-,i-,t-,e-
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""
"filetype plugin indent on
set completeopt=longest,menu
""

"set runtimepath^=~/.vim/bundle/ctrlp.vim
"let g:ctrlp_match_window_bottom=1
let g:ctrlp_regexp = 1
let g:ctrlp_max_files = 0
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:15,results:15'
"let g:ctrlp_match_window = 'bottom,order:ttb,min:999,max:999,result:999'
let g:ctrlp_user_command = ['cscope.files', 'cat %s/cscope.files']
let g:ctrlp_root_markers = ['cscope.files']

"
"**************************************
"******SrcExpl Setting Start **********
"**************************************
"
" // Open Source Explorer at vim open
"autocmd VimEnter * SrcExplToggle

" // The switch of the Source Explorer
nnoremap se :SrcExplToggle<CR>

" // Set the height of Source Explorer window
let g:SrcExpl_winHeight = 15

" // Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100

" // Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"

" // Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"

" // In order to avoid conflicts, the Source Explorer should know what plugins
" // except itself are using buffers. And you need add their buffer names into
" // below listaccording to the command ":buffers!"
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_",
        \ "ControlP",
    \ ]

" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1

" // Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" // create/update the tags file
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."

" // Set "<F12>" key for updating the tags file artificially
let g:SrcExpl_updateTagsKey = "<F12>"

" // Set "<F3>" key for displaying the previous definition in the jump list 
let g:SrcExpl_prevDefKey = "<F3>"

" // Set "<F4>" key for displaying the next definition in the jump list
let g:SrcExpl_nextDefKey = "<F4>"

"SrcExpl Setting end

"TagHighlight seting
"start
"end

"If this (buffer-local) variable is set to 1, running
"|UpdateTypesFile| is equivalent to running |UpdateTypesFileOnly|.
let b:TypesFileDoNotGenerateTags = 1

"This (buffer-local) variable can be used to limit the number of
"languages searched for by the generation script.  This can speed up
"tag generation somewhat.  For example, if you are working on C/C++
"source code, use:
let b:TypesFileLanguages = ['c']
nnoremap <C-u>f :UpdateTypesFileOnly<CR>


" NERDTree
nnoremap nt :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', 'pkg']

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


function g:UpdateCurrentHighLight(name,suffix)
  for cur_key in keys(g:CurrentHighlightWords)
    exe 'hi ' . g:CurrentHighlightWords[cur_key] . ' ' . 'ctermfg=0  ctermbg=11'
    exe 'syn keyword ' . g:CurrentHighlightWords[cur_key] . ' ' . cur_key
   endfor
endfunction

if ! exists('g:TagHighlightSettings')
  let g:TagHighlightSettings = {}
endif
let g:TagHighlightSettings['PostReadHooks']=['g:UpdateCurrentHighLight']
if ! exists('g:CurrentHighlightWords')
  let g:CurrentHighlightWords = {}
endif
function Chiz_highlightCurrent_Toggle()
  let cursor_word = expand("<cword>")
  if (has_key(g:CurrentHighlightWords, cursor_word))
    exe 'syn clear ' . g:CurrentHighlightWords[cursor_word]
    call remove(g:CurrentHighlightWords, cursor_word)
    exe 'ReadTypes'
  else
    let g:CurrentHighlightWords[cursor_word]='curHiType_' . cursor_word
     exe 'ReadTypes'
  endif
endfunction
nnoremap <F8> : call Chiz_highlightCurrent_Toggle()<CR>
