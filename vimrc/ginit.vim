" NEO/VIM CONFIGURATIONS
" Author:  valsorym <valsorym.e@gmail.com>
" Copyleft: 2012-2019

" For vim, save as: ~/.gvimrc
" For neovim, save as: ~/.config/nvim/ginit.vim


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"''                                                                         ''"
"''                              EXPANSIONS                                 ''"
"''                                                                         ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'' BASE SETTINGS                                                           ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
" ELEMENTS
" Disable graphics menu bar, toolbar and right-hand scroll bar.
if has('nvim')
    GuiTabline 0
else
    set guioptions=m
    set guioptions=T
    set guioptions-=r
    set guioptions-=l
    set guioptions-=T
endif

" WINDOW
" Window size.
if has('nvim')
    call GuiWindowMaximized(1)
else
    set lines=37 columns=126
endif

" FONT
" Font style.
if has('nvim')
    Guifont Courier New:h13
else
    if has("gui_running")
        if has("gui_gtk2")
            set guifont=Courier\ New\ 13
        elseif has("gui_gtk3")
            set guifont=Courier\ New\ 13
        elseif has("gui_photon")
            set guifont=Courier\ New:s13
        elseif has("gui_kde")
            set guifont=Courier\ New/13/-1/5/50/0/0/0/1/0
        elseif has("x11")
            set guifont=-*-Courier\ New-medium-r-normal-*-*-180-*-*-m-*-*
        elseif has("gui_macvim")
            set gfn=Courier\ New:h13
        else
            set guifont=Courier\ New:h13:cDEFAULT
        endif
    endif
endif

" Disable beeping (aka 'bell') and window flashing, it is only for GUI Vim.
set visualbell t_vb=

" SEARCH
" Highlight searched words.
set hlsearch
nnoremap <Esc> :noh<return><Esc>

" STATUSBAR SETTINGS
" Show pressed keys in normal mode.
set showcmd

" To display the status line always.
set laststatus=2

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'' SYNTAX HIGHLIGHTING RULES                                               ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
" COLOR SCHEME
" Highlight syntax and editor color scheme.
syntax on
set background=dark
colorscheme geek_gui " valsorym/vim-colors
""" colorscheme absent-contrast " rainglow/vim

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
"'' KEY MAPPING                                                             ''"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
" Mapping helps
"     :nmap   display normal mode maps;
"     :imap   display insert mode maps;
"     :vmap   display visual and select mode maps;
"     :smap   display select mode maps;
"     :xmap   display visual mode maps;
"     :cmap   display command-line mode maps;
"     :omap   display operator pending mode maps.

" COPY/PASTE
" Copy, Paste and Cut as X11 style: Ctrl+c, Ctrl+v and Ctrl+x.
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

