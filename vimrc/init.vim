" NEO/VIM CONFIGURATIONS
" Author:  valsorym <valsorym.e@gmail.com>
" Copyleft: 2012-2021

" For vim, save as: ~/.vimrc
" For neovim, save as: ~/.config/nvim/init.vim


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"''                                                                         ''"
"''                              EXPANSIONS                                 ''"
"''                                                                         ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
set shell=/bin/bash
if has('nvim')
    let s:BASE_DIR=expand("~/.config/nvim")
else
    let s:BASE_DIR=expand("~/.vim")
endif

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'' VUNDLE                                                                  ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
" USAGE:
"   :PluginInstall
"   :PluginUpdate
" DOC:
"   https://github.com/VundleVim/Vundle.vim
"
set nocompatible
filetype off
let &rtp .= ','.expand(s:BASE_DIR . '/bundle/Vundle.vim')
call vundle#begin(s:BASE_DIR . '/bundle')

" INSTALL VUNDLE.VIM
" VIM
"   $ git clone https://github.com/VundleVim/Vundle.vim.git \
"     ~/.vim/bundle/Vundle.vim
" NEOVIM
"   $ git clone https://github.com/VundleVim/Vundle.vim.git \
"     ~/.config/nvim/bundle/Vundle.vim
Plugin 'VundleVim/Vundle.vim'

" PLUGIN LIST:
Plugin 'valsorym/vim-tabs'
Plugin 'valsorym/vim-clear'
Plugin 'valsorym/vim-highlighting'
Plugin 'valsorym/vim-code-theme'

Plugin 'valsorym/rainglow-vim', {'name': 'vim'} " 'rainglow/vim'
Plugin 'valsorym/scrooloose-nerdtree', {'name': 'nerdtree'} " 'scrooloose/nerdtree'
Plugin 'valsorym/jistr-vim-nerdtree-tabs', {'name': 'vim-nerdtree-tabs'} " 'jistr/vim-nerdtree-tabs'
Plugin 'valsorym/jlanzarotta-bufexplorer', {'name': 'bufexplorer'} " 'jlanzarotta/bufexplorer'

Plugin 'valsorym/shougo-deoplete.nvim', {'name': 'deoplete.nvim'} " 'shougo/deoplete.nvim'
Plugin 'valsorym/roxma-nvim-yarp', {'name': 'nvim-yarp'} " 'roxma/nvim-yarp'
Plugin 'valsorym/roxma-vim-hug-neovim-rpc', {'name': 'vim-hug-neovim-rpc'} " 'roxma/vim-hug-neovim-rpc'

Plugin 'valsorym/chrisbra-colorizer', {'name': 'colorizer'} " 'chrisbra/colorizer'
Plugin 'valsorym/matze-vim-move', {'name': 'vim-move'} " 'matze/vim-move'
Plugin 'valsorym/elzr-vim-json', {'name': 'vim-json'} " 'elzr/vim-json'
Plugin 'valsorym/terryma-vim-multiple-cursors', {'name': 'vim-multiple-cursors'} " 'terryma/vim-multiple-cursors'

Plugin 'valsorym/posva-vim-vue', {'name': 'vim-vue'} " 'posva/vim-vue'
Plugin 'valsorym/fatih-vim-go', {'name': 'vim-go'} " 'fatih/vim-go'
Plugin 'valsorym/vim-scripts-grep.vim', {'name': 'grep.vim'} " 'vim-scripts/grep.vim'
Plugin 'valsorym/preservim-tagbar', {'name': 'tagbar'} " 'preservim/tagbar'
Plugin 'valsorym/herringtondarkholme-yats.vim', {'name': 'yats.vim'} " 'herringtondarkholme/yats.vim'
Plugin 'valsorym/yuezk-vim-js', {'name': 'vim-js'} " 'yuezk/vim-js'
Plugin 'valsorym/maxmellon-vim-jsx-pretty', {'name': 'vim-jsx-pretty'} " 'maxmellon/vim-jsx-pretty'

call vundle#end()
filetype plugin indent on


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"''                                                                         ''"
"''                             BASE SETTINGS                               ''"
"''                                                                         ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'' MAIN                                                                    ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"

" BACKUP AND SWAP FILES
set backup
set undodir=/tmp//
set backupdir=/tmp//
set directory=/tmp//

" INCOMPATIBILITY WITH VI
" Use the full capabilities of vim without compatibility with vi.
set nocompatible      " Turn arrows in the mode of INSERT.

nnoremap <silent> <ESC>OA <UP>
nnoremap <silent> <ESC>OB <DOWN>
nnoremap <silent> <ESC>OC <RIGHT>
nnoremap <silent> <ESC>OD <LEFT>
inoremap <silent> <ESC>OA <UP>
inoremap <silent> <ESC>OB <DOWN>
inoremap <silent> <ESC>OC <RIGHT>
inoremap <silent> <ESC>OD <LEFT>

" BIPING
" Disable beeping (aka 'bell') and window flashing, it's work
" in the terminal and GUI mode.
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" ENCODING SETTINGS
" UTF8 and type ending of line.
set termencoding=utf-8
set fileencodings=usc-bom,utf-8mdefault,cp1251
set ffs=unix,dos,mac
if has('multi_byte')
    set encoding=utf-8
    set fileencodings=utf-8,ucs-bom,latin1
    setglobal fileencoding=utf-8
    if &termencoding == ''
        let &termencoding=&encoding
    endif
endif

" COLOR SCHEME
" Editor color scheme.
syntax on
set background=dark
colorscheme code-theme-term

" Change cursorline for gVIM/NeoVim-QT
if $TERM != "xterm-256color"
    " Different cursor styles in different buffers.
    " NERD_tree and Tagbar have a brighter cursor color when buffer is active,
    " and dim cursor color when focus is lost.
    " Main editor buffor has dim cursor color by default and hides the cursor
    " when buffer lost focus.
    setlocal nocursorline
    augroup CursorLine
        au!
        au BufLeave,WinLeave,FocusLost,CmdwinLeave * call OnLeave()
        au BufEnter,VimEnter,WinEnter,BufWinEnter,FocusGained,CmdwinEnter * call OnFocus()
    augroup END

    function! OnFocus()
        if (bufname("%") =~ "NERD_Tree_" || bufname("%") =~ "__Tagbar__")
            setlocal cursorline
            hi clear CursorLine
            hi clear Cursor
            hi CursorLine guibg=#003a45 guifg=#ffffff gui=bold
            hi Cursor guibg=#003a45 guifg=#ffffff gui=bold
        else
            setlocal cursorline
            hi clear CursorLine
            hi clear Cursor
            hi CursorLine guibg=#00202a
            hi Cursor guibg=#555555
            call OnLeave() " uncomment it to hide cursorline in main window
        endif
    endfunction

    function! OnLeave()
        if (!(bufname("%") =~ "NERD_Tree_" || bufname("%") =~ "__Tagbar__"))
            setlocal nocursorline
        endif
    endfunction
endif
""" colorscheme absent-contrast " rainglow/vim

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'' EDITOR                                                                  ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
" TAB KEY SETTING
" Setting indentation when press the Tab key.
"     smarttab    when on, a <Tab> in front of a line inserts blanks
"                 according to 'shiftwidth'.  'tabstop' or 'softtabstop' is
"                 used in other places. A <BS> will delete a 'shiftwidth'
"                 worth of space at the start of the line;
"     expandtab   In Insert mode, use the appropriate number of spaces to
"                 insert a <Tab>. Spaces are used in indents with the '>' and
"                 '<' commands and when 'autoindent' is on. To insert a real
"                 tab when 'expandtab' is on, use CTRL-V<Tab>;
"     tabstop     magnitude of the indentation for Tab style;
"     softtabstop magnitude of the indentation for Space style;
"     shiftwidth  the number of spaces used in the indentation
"                 commands, such as >> or <<.
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" COMMAND LINE
" Base settings.
set cmdheight=2
set completeopt+=menuone
set completeopt-=preview

" LINE NUMBERING
" Show line numbers in the file.
set number
set numberwidth=5

" TITLE SETTINGS
" Custom title style.
set title
set titlestring=VIM:\ %-25.55F titlelen=70

" STATUSBAR SETTINGS
" Show pressed keys in normal mode.
set showcmd

" To display the status line always.
set laststatus=2

" Display typed commands in the statsubar and make autocompletion using
" the <Tab> key. Always show the status of open file in the status bar.
set wildmenu
set statusline=%<%f\%{(&modified)?'\*\ ':''}%*%=C:%c%V,R:%l\ %P\ \[%{&encoding}\]

" BACKSPACE
" Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode:
"     indent  allow backspacing over autoindent;
"     eol     allow backspacing over line breaks (join lines);
"     start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"             stop once at the start of insert.
set backspace=indent,eol,start

" WORKSPACE SIZE
" Maximum width of text that is being inserted and horizontal line (marker)
" for the 'tw' position. And set the wrap method of words that go beyond
" these boundaries in width.
set colorcolumn=80
set nowrap
" set textwidth=79
" set wrap
" set linebreak
" set dy=lastline
" set sidescroll=5
" set sidescrolloff=5
" set listchars+=precedes:<,extends:>

" INDENT SETTINGS
" Automatic indentation of newline:
"     autoindent  copy indent from current line when starting a new line
"                 (typing <CR> in Insert mode or when using the "o" or "O"
"                 command);
"     cindent     enables automatic C program indenting.
set autoindent

" SPECIAL CHAR SETTINGS
"  Display wildcards: tabs and spaces at the end.
set list listchars=tab:»·,trail:·

" FILE SETTINGS
"  Automatic refresh of the buffer if an open file is changed.
set autoread

" SYSTEM
"  The length of time Vim waits after you stop typing before it
"  triggers the plugin is governed by the setting updatetime.
"  Defaults == 5000.
"  Note: The lower the updatetime - the more glitches!
"        For Vim 7 the value must not be less than 1000 (one thousand)!
set updatetime=256

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'' FILE ASSOCIATION                                                        ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
" Correct syntax highlighting for certain file types.
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead *.html set filetype=htmldjango
autocmd BufNewFile,BufRead *.tmpl set filetype=html.tornadotmpl
autocmd BufNewFile,BufRead *.py set filetype=python
autocmd BufNewFile,BufRead *.pyx set filetype=cython
autocmd BufNewFile,BufRead *.css set filetype=css
autocmd BufNewFile,BufRead *.scss set filetype=scss
autocmd BufNewFile,BufRead *.po set filetype=po
autocmd BufNewFile,BufRead *.go set filetype=go
autocmd BufNewFile,BufRead *.jinja set filetype=jinja
autocmd BufNewFile,BufRead *.json set filetype=json
autocmd BufNewFile,BufRead *.template set filetype=txt
autocmd BufNewFile,BufRead *.gql set filetype=graphql
autocmd BufNewFile,BufRead *.graphql set filetype=graphql
autocmd BufNewFile,BufRead *.proto set filetype=proto
autocmd BufNewFile,BufRead *.cfg set filetype=haproxy
autocmd BufRead,BufNewFile */nginx/*.conf if &ft == '' | setfiletype nginx | endif

" ... for typescript and html/css files set 2 spaces.
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType html.tornadotmpl setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType jinja setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType sh setlocal shiftwidth=2 tabstop=2
autocmd FileType make setlocal noexpandtab
autocmd FileType go setlocal noexpandtab
autocmd FileType vue setlocal shiftwidth=2 tabstop=2
autocmd FileType graphql setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType proto setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType haproxy setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType nginx setlocal expandtab shiftwidth=2 softtabstop=2


" TypeScript: see TYPESCRIPT PLUGIN section
" autocmd BufNewFile,BufRead *.ts set filetype=typescript

" GoLang: see VIM-GO PLUGIN section
" autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" When updated the buffer need update syntax highlighting too. This is
" important when searching in large files.
autocmd BufEnter * :syntax sync fromstart

" Old version NeoVim and Vim.
if has('nvim')
    let g:go_version_warning=0
endif


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'' GLOBAL KEY MAPPING                                                      ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
" UNDO/REDO
" USAGE: Ctrl+u and Ctrl+r
nmap u :For `Undo` and `Redo` use the `C-u` and `C-r` respectively!
imap <C-u> <Esc>:undo<CR>
nmap <C-u> :undo<CR>
imap <C-r> <Esc>:redo<CR>
nmap <C-r> :redo<CR>

" COPY/PASTE
" USAGE: Ctrl+Insert and Shift+Insert or Ctrl+C and Ctrl+V
vmap <C-Insert> "+y
vmap <S-Insert> "+p
vmap <C-c> "+y
imap <C-c> <ESC> "+y
vmap <C-v> "+p
imap <C-v> <ESC> "+p

" SAVE CURRENT FILE
" USAGE: F2
imap <F2> <Esc>:w!<CR>
nmap <F2> :w!<CR>

" OPEN ENCODING MENU
" USAGE: F8
set wildmenu
set wcm=<Tab>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
map <F8> :emenu Encoding.<TAB>


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'' EDIT MODE                                                               ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
" SEARCH
" Ignore upper/lower cases.
set ignorecase
set smartcase

""" Highlight found matches and remove backlight when button `Esc` is pressed.
set hlsearch
nnoremap <Esc> :noh<return><Esc>


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"''                                                                         ''"
"''                           PLUGIN SETTINGS                               ''"
"''                                                                         ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'' TABS                                                                    ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
" Styling of the tabs.
" USAGE:
"     F5     - open previous tab;
"     F6     - open next tab;
"     F7     - make new tab;
"     Ctrl+j - move tab left;
"     Ctrl+k - move tab right;
"     Ctrl+h - move tab to first position;
"     Ctrl+l - move tab to last position;
"     Ctrl+z - open first tab.
" DOC:
"     https://github.com/valsorym/vim-tabs

" BUFFER/TAB SETTINGS
" Show panel of tabs and limit the number of open tabs.
set tabpagemax=55 " for use -p flag: vim -p file_1 file_2 ... file_N
set showtabline=2

" PREVIOUS TAB
" USAGE: F5 or Ctrl+ArrowLeft
imap <F5> <Esc>:tabprev<CR>
nmap <F5> :tabprev<CR>
map <C-Left> :tabprev<CR>

" NEXT TAB
" USAGE: F6 or Ctrl+ArrowRight
imap <F6> <Esc>:tabnext<CR>
nmap <F6> :tabnext<CR>
map <C-Right> :tabnext<CR>

" CREATE NEW TAB
" USAGE: F7 or Ctrl+n
imap <F7> <Esc>:tabnew<CR>
nmap <F7> :tabnew<CR>
imap <C-n> <Esc>:tabnew<CR>
nmap <C-n> :tabnew<CR>

" VISUAL SELECT ALL
" USAGE: Ctrl+a
map <C-a> <Esc>ggVG<CR>

" MOVE TAB TO LEFT
" USAGE: Ctrl+J
imap <C-j> <Esc>:call MoveTabLeft()<CR>
nmap <C-j> :call MoveTabLeft()<CR>

" MOVE TAB TO RIGHT
" USAGE: Ctrl+k
imap <C-k> <Esc>:call MoveTabRight()<CR>
nmap <C-k> :call MoveTabRight()<CR>

" MOVE TAB TO FIRST POSITION
" USAGE: Ctrl+h
imap <C-h> <Esc>:call MoveTabFirst()<CR>
nmap <C-h> :call MoveTabFirst()<CR>

" MOVE TAB TO LAST POSITION
" USAGE: Ctrl+l
imap <C-l> <Esc>:call MoveTabLast()<CR>
nmap <C-l> :call MoveTabLast()<CR>

" OPEN FIRST TAB
" USAGE: Ctrl+z
imap <C-z> <Esc>:call OpenFirstTab()<CR>
nmap <C-z> :call OpenFirstTab()<CR>

" TAB STYLE
" 0. Short tabs - only filename.
" 1. Show parent folder + filename.
" 2. Show only first and last symbol from parent folder + filename.
" 3. Show only first symbol from parent folder + filename.
" 4. Show only three first symbol from parent folder + filename.
" Show only three first symbol from parent folder + filename.
set tabline=%!TabName(4)

""" Automatically move the tab to the last position.
if has('autocmd')
    " If open a lot of tabs and when the tab is editing - moved tab to last
    " position.
    autocmd InsertEnter * call AutoMoveTabLast()

    " If open new tab - move it on the last position.
    autocmd BufNew * call NewTabMoveLast()

    " Autoclose duplicate tabs.
    " + Add `CloseDuplicateTabs` - duplicate tabs closing command.
    " * If used NewTabMoveLast method - use CloseDuplicateTabs(1).
    autocmd BufEnter * call CloseDuplicateTabs(1)
    command CloseDuplicateTabs :call CloseDuplicateTabs(1)
endif " autocmd


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'' CLEAR DEBRIS                                                            ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
" Remove trailing blanks.
" USAGE: <A-x>, a
" DOC:
"     https://github.com/valsorym/vim-clear
"
" Key mapping.
command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
imap <C-x> <Esc>:TrimSpaces<CR>
nmap <C-x> :TrimSpaces<CR>
nmap <A-x> :TrimSpaces<CR>

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'' NERDTREE / NERDTREE-TABS                                                ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
" The NERD tree allows you to explore your filesystem and to open files and
" directories. It presents the filesystem to you in the form of a tree which
" you manipulate with the keyboard and/or mouse. It also allows you to
" perform simple filesystem operations.
" USAGE: F9
" DOC:
"     http://www.vim.org/scripts/script.php?script_id=1658
"     https://github.com/scrooloose/nerdtree

" Position and size.
let g:NERDTreeWinPos='left'
let g:NERDTreeWinSize=37

" If used NERDTreeFind - find the file in the directory tree is not my root
" directory (installed as Shift+c). But if set the autochdir the root
" directory will be changed to the directory where stored the current file.
""" set autochdir
set noautochdir
let NERDTreeChDirMode=2

""" Ignore files.
let g:NERDTreeIgnore=[
    \ "\\.pyc$",
    \ "\\.swo$",
    \ "\\.swp$",
    \ "\\.core$",
    \ "\\.o$",
    \ "^_del\\.",
    \ "^\\.del\\."
\]

" On startup, always focus file window after startup.
""" let g:nerdtree_tabs_smart_startup_focus=2

" Open NERDTree on console vim startup.
" Note: sometimes it shows an error in the console!!!
let g:nerdtree_tabs_open_on_console_startup=1

" Automatically find and select currently opened file in NERDTree.
" Note: raise an exception if an empty buffer is opened!!!
""" let g:nerdtree_tabs_autofind=1

" Add Bookmark.
imap <C-b> <Esc>:Bookmark<Space>
nmap <C-b> :Bookmark<Space>

" AUTOMATICALLY SYNC NERDTREE WITH OPENED FILE
" NERDTreeIsOpen return true if NERDTree is opened.
function! NERDTreeIsOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" NERDTreeSync call the NERDTreeTabsFind method.
function! NERDTreeSync()
    " The path is not synchronized if the cursor is in the tagbar buffer.
    let s:is_tagbar_buffer=stridx(expand("%"), "__Tagbar__")

    if &modifiable && NERDTreeIsOpen() && strlen(expand('%')) > 0 && !&diff
                \ && s:is_tagbar_buffer < 0
        try
            NERDTreeTabsFind
            wincmd p

            " Update window's title.
            " Add information about current project name.
            let t:root=g:NERDTree.ForCurrentTab().getRoot().path.str()
            let s:root=fnamemodify(t:root, ':t')
            let a:root=substitute(expand("%"), t:root . "/" , "", "")
            "exec "set titlestring=". s:root .":\\ %-25.55F titlelen=79"
            exec "set titlestring=". toupper(s:root) .":\\ \\ \\ ./". a:root
                        \ ." titlelen=79"
        catch
        endtry
    endif
endfunction

" Auto sync.
autocmd BufEnter * call NERDTreeSync()

" OPEN/CLOSE NERDTREE
" NERDTreeSmartOpen smart open NERDTree.
function! NERDTreeSmartOpen()
    NERDTreeTabsToggle
    "if NERDTreeIsOpen()
    "    NERDTreeTabsToggle
    "else
    "    try
    "        NERDTreeTabsFind
    "    catch
    "        NERDTreeTabsToggle
    "    endtry
    "endif
endfunction

" Togle NERDTree.
"" nmap <silent> <F9> <plug>NERDTreeTabsToggle<CR>
nmap <silent> <F9> :call NERDTreeSmartOpen()<CR>

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'' BUFEXPLORER                                                             ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
" Plugin for easily browsing for buffers/tabs.
" USAGE: Ctrl+t
" DOC:
"     https://github.com/andrewvc/vim-settings/blob/master/doc/bufexplorer.txt

" Don't show default and detail help.
let g:bufExplorerDefaultHelp=0
let g:bufExplorerDetailedHelp=0

" Don't show dirs, show relative paths and split filename with path.
let g:bufExplorerShowDirectories=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSplitOutPathName=0

"  Split new window above current
let g:bufExplorerSplitBelow=0

" Sort by full file path name.
let g:bufExplorerSortBy='fullpath'

" Open buffer/tab list.
" OpenBufExplorer open cell BufExplorerHorizontalSplit.
function! OpenBufExplorer()
    " Use only in editable buffers.
    if &modifiable &&  strlen(expand('%')) > 0 && !&diff
        try
            BufExplorerHorizontalSplit
        catch
        endtry
    endif
endfunction

imap <C-t> <Esc> :call OpenBufExplorer()<CR>
nmap <C-t> :call OpenBufExplorer()<CR>

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'' DEOPLETE                                                                ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
" It provides an extensible and asynchronous completion framework for
" neovim/Vim8. Next generation completion framework after neocomplcache.
" DOC:
"     https://github.com/Shougo/deoplete.nvim
if has('nvim') || has("gui_running")
    let g:deoplete#enable_at_startup=1
endif

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'' COLORIZER                                                               ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
" Color highlight toggle.
" Highlights the specific color code in css,
" for example: #fff, #efefef, red etc.
" USAGE: Ctrl+i
" DOC:
"     https://github.com/valsorym/vim-colorizer

" Key mapping.
nmap <A-i> :ColorToggle<CR>

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'' MOVE                                                                    ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
" USAGE:
"     Shift-k - move current line/selections up;
"     Shift-j - move current line/selections down.
" DOC:
"     https://github.com/matze/vim-move

" Key mapping.
let g:move_key_modifier='S'

" Do not change of the moved block.
let g:move_auto_indent=0

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'' MULTIPLE CURSORS                                                        ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
" USAGE:
"     Shift-f - start/the allocation of the next word under the cursor, and:
"         Shift-b - the allocation of the previous word under the cursor;
"         Shift-x - ignore the current word and move on to the next;
"     After selecting all the words, you can start editing:
"         c - remove word and go into edit mode;
"         I - set the cursor in the begin of the word;
"         A - set the cursor in the end of the word.
" DOC:
"     https://github.com/terryma/vim-multiple-cursors

" Disable default mapping.
let g:multi_cursor_use_default_mapping=0

" Key mapping.
let g:multi_cursor_next_key='<S-f>'
let g:multi_cursor_prev_key='<S-b>'
let g:multi_cursor_skip_key='<S-x>'
let g:multi_cursor_quit_key='<Esc>'

" Fix bug with deoplete: https://github.com/Shougo/deoplete.nvim/issues/265
function g:Multiple_cursors_before()
    if has('nvim') || has("gui_running")
        call deoplete#custom#buffer_option('auto_complete', v:false)
    endif
endfunction

function g:Multiple_cursors_after()
    if has('nvim') || has("gui_running")
        call deoplete#custom#buffer_option('auto_complete', v:true)
    endif
endfunction

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'' JSON                                                                    ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
" JSON for Vim.
let g:vim_json_syntax_conceal=0 " 0 - JSON highlighting in raw mode.


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'' TYPESCRIPT                                                              ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
let g:typescript_compiler_binary='tsc'
let g:typescript_compiler_options=''
autocmd BufNewFile,BufRead *.ts set filetype=typescript
"autocmd FileType typescript :set makeprg=tsc
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'' GOLANG                                                                  ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
" GoLang development plugin for Vim.
" USAGE: (only for .go files)
"     Ctrl+f - run go fmt.
" DOC:
"     https://github.com/fatih/vim-go
let g:go_fmt_command="goimports"
""" let g:go_fmt_command="golines"
""" let g:go_fmt_options={
"""     \ 'golines': '-m 79',
"""     \ }
let g:go_fmt_fail_silently=1
let g:go_fmt_autosave=1 " automatic formatting when saving
let g:go_doc_keywordprg_enabled=0


"let g:go_list_type="quickfix"
"let g:go_autodetect_gopath=1
let g:go_highlight_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_extra_types=1
let g:go_highlight_generate_tags=1
let g:go_highlight_function_calls=1
"let g:go_gocode_unimported_packages=1

augroup go
    autocmd!
    " Customization .go files: show by default 4 spaces for a tab.
    autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

    " Key mapping.
    " Run GoFmt.
    autocmd FileType go nmap <C-f> <Esc>:GoFmt<CR>
augroup END

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'' TAGBAR                                                                  ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
" USAGE:
"     F10 - toggle tagbar
" DOC:
"     https://github.com/preservim/tagbar
"
"     GoLang: https://github.com/jstemmer/gotags
" Smart toggle tagbar.
function! ToggleTagbar()
    " Disable autofocus force.
    let g:tagbar_autofocus=0

    " Don't toggle tagbar if cursor is in tagbar or nerdtree buffers.
    let s:is_tagbar_buffer=stridx(expand("%"), "__Tagbar__")
    let s:is_nerdtree_buffer=stridx(expand("%"), "NERD_tree_")
    let b:initial_buffer=1

    if s:is_tagbar_buffer >=0 || s:is_nerdtree_buffer >=0
        echomsg "You cannot run TagBar inside TagBar or NERDTree buffers!"
    else
        TagbarToggle
    endif

    " Go back to initial buffer.
    while !exists('b:initial_buffer')
        wincmd w
    endwhile
    unlet b:initial_buffer
endfunction

nmap <F10> :call ToggleTagbar()<CR>

let g:tagbar_width=36
let g:tagbar_left=0
let g:tagbar_autofocus=0
let g:tagbar_compact=1
let g:tagbar_sort=1      " tagbar shows tags in order of they created in file
let g:tagbar_foldlevel=1 " 0 - close tagbar folds by default

" https://github.com/preservim/tagbar/wiki
let g:tagbar_type_go={
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

let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \ ],
  \ 'sort' : 0
\ }

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'' RESWAP                                                                  ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
" Reswap (reconnect the swap file) - it helps when working with files through
" SSHFS, after crash.
" USAGE: Shift+Q (Command Mode)
function ReSwap()
    execute 'set noswapfile'
    execute 'set swapfile'
    execute ':echo "The swap file was changed!"'
endfunction

nmap <A-q> :call ReSwap()<CR>

