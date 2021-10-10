
# NEO/VIM CONFIGS

It's NEO/VIM configurations files for developers comfortable work: Shell, Bash, C, C++, GoLang, Python (Django, Tornado template syntaxs), CSS/SCSS, HTML, JavaScript (JSON syntax), TypeScript.

## Required

Required parameters:

- OS UNIX-Like: Linux, FreeBSD, MacOS, etc.;
- vim (version: 8.0 +) or neovim (version 0.3.7 +);
- git;
- curl;
- ctags;
- golang 1.15+.

## Packages

Configurations include the installation of the *forks* of following packages:

- [rainglow/vim](https://github.com/rainglow/vim) - 320+ color themes for VIM;
- [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree) - A tree explorer plugin for vim;
- [jistr/vim-nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs) - NERDTree and tabs together in Vim, painlessly;
- [jlanzarotta/bufexplorer](https://github.com/jlanzarotta/bufexplorer) - BufExplorer Plugin for Vim;
- [shougo/deoplete.nvim](https://github.com/shougo/deoplete.nvim) - Dark powered asynchronous completion framework for neovim/Vim8;
- [roxma/nvim-yarp](https://github.com/roxma/nvim-yarp) - Yet Another Remote Plugin Framework for Neovim;
- [roxma/vim-hug-neovim-rpc](https://github.com/roxma/vim-hug-neovim-rpc) - Is an **experimental project**, trying to build a compatibility layer for neovim rpc client working on vim8;
- [chrisbra/colorizer](https://github.com/chrisbra/colorizer) - Color hex codes and color names;
- [matze/vim-move](https://github.com/matze/vim-move) - Plugin to move lines and selections up and down;
- [elzr/vim-json](https://github.com/elzr/vim-json) - A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly;
- [terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) - True Sublime Text style multiple selections for Vim;
- [posva/vim-vue](https://github.com/posva/vim-vue) - Syntax Highlight for Vue.js components;
- [fatih/vim-go](https://github.com/fatih/vim-go) - Go development plugin for Vim;
- [vim-scripts/grep.vim](https://github.com/vim-scripts/grep.vim) - Grep search tools integration with Vim;
- [preservim/tagbar](https://github.com/preservim/tagbar) - Vim plugin that displays tags in a window, ordered by scope;
- [herringtondarkholme/yats.vim](https://github.com/herringtondarkholme/yats.vim) - Yet Another TypeScript Syntax: The most advanced TypeScript Syntax Highlighting in Vim;
- [yuezk/vim-js](https://github.com/yuezk/vim-js) - The most accurate syntax highlighting plugin for JavaScript and Flow.js;
- [maxmellon/vim-jsx-pretty](https://github.com/maxmellon/vim-jsx-pretty) - JSX and TSX syntax pretty highlighting for vim;
- [andymass/vim-matchup](https://github.com/andymass/vim-matchup) - Navigate and highlight matching words;

## Quick Start

Installation of base configurations is quite simple:
For vim:

```
$ rm -Rf /tmp/xvimrc && \
git clone git@github.com:valsorym/xvimrc.git /tmp/xvimrc && \
cd /tmp/xvimrc && \
make vim
```

For neovim:

```
$ rm -Rf /tmp/xvimrc && \
git clone git@github.com:valsorym/xvimrc.git /tmp/xvimrc && \
cd /tmp/xvimrc && \
make nvim
```

## Keyboard Shortcuts
  
### Main.

- `F2` - save file;
- `F8` - show encoding menu;
- `F10` - open/close TagBar;
- `F12` - show/hide row numbers line;
- `C-o` - open file;
- `C-w`, `<-` or `->` - choose window;
- `C-u` - undo (don't use just the `u` for undo);
- `C-r` - redo;
- `A-q` - reconnect the swap file - it helps when working with files through SSHFS, after crash;
- `A-i` - color highlight toggle;
- `C-x`, `a` - remove trailing blanks;
- `C-Up` / `C-Down` - scroll a 30% of the screen up or down;
- `C-S-?` - show which function we are inside;
- `%` - jump to the beginning `[%` or end `]%` of a block of code.

P.s. The leader button set as `.` (dot).

P.p.s. The other buttons correspond to the parameters by default.

### Tabs.

- `F4` - go to 8N* tab;
- `C-t` - list of buffers (tabs);
- `C-n` - open new tab (or - `F7`);
- `C-h` - move tab to first position;
- `C-j` - move tab to left;
- `C-k` - move tab to right;
- `C-l` - move tab to last position;
- `C-z` - open first tab;
- `F5` - tab prev;
- `F6` - tab next.

### Copy & Paste system's clipboard.

- `C-a` - select all (visula mode);
- `C-Ins` - copy text selected in visual mode (only in `gvim` or `vim-gtk`);
- `C-c` - copy text selected in visual mode;
- `S-Ins` - paste;
- `C-v` and `C + v` (i.e. double down) - paste;
- `C-v`, `v` or `S-v` + `C-Ins` - copy text to an external clipboard;
- `S-a`, `i`, `S-r` or `r` + `S-Ins` - paste from an external clipboard.

P.s. Paste into **menu bar**: open menu `S-:` and paste data from the clipboard `C-r`, `S-+`.

P.P.s. Install the `vim-gtk` package, and use `select-editor` to select the `vim-gtk` by default.

  
### Flexible editing.

- `C-j` - move current line/selections down;
- `C-k` - move current line/selections up;
- `S-f` - set multiple cursor mode / the allocation of the next word under the cursor, and:
  - During the search:
    - `S-b` - the allocation of the previous word under the cursor;
    - `S-x` - ignore the current word and move on to the next;
  - After selecting all the words, you can start editing:
    - `c` - remove word and go into edit mode;
    - `I` - set the cursor in the begin of the word;
    - `A` - set the cursor in the end of the word.


### Folding commands.

- `zf#j` - creates a fold from the cursor down # lines, for example `zf3j` - hide 3 lines;
- `zf/` - string creates a fold from the cursor to string;
- `zj` - moves the cursor to the next fold;
- `zk` - moves the cursor to the previous fold;
- `za` - toggle a fold at the cursor;
- `zo` - opens a fold at the cursor;
- `zO` - opens all folds at the cursor;
- `zc` - closes a fold under cursor;
- `zm` - increases the foldlevel by one;
- `zM` - closes all open folds;
- `zr` - decreases the foldlevel by one;
- `zR` - decreases the foldlevel to zero -- all folds will be open;
- `zd` - deletes the fold at the cursor;
- `zE` - deletes all folds;
- `[z` - move to start of open fold;
- `]z` - move to end of open fold.

### Visual block.

Click `C-v` and move arrow for select block, and click:
- `c` - to replace the contents of the block;
- `d` - to delete the content of the block;
- `S-i` - to move the cursor to the begin of the block (handy when you add spaces at the beginning of the line);
- `S-a` - to move the cursor to the end of the block.

P.s. Enter some text (the text will be written only in the one line), and click `Esc`.

### NERDTree.

- `F9` - open/close NERDTree;
- `S-b` - show bookmarks;
- `C-b` - add folder to bookmarks;
- `S-d` - remove bookmark (in bookmark section);
- `S-c` - choose folder as root;
- `m` - open file manager menu.

## Tab style.

Problem: If we have such a directory structure:

```
myapp/
  models/
    accounts.py
  ...
  forms/
    accounts.py
  ...
  views/
    accounts.py
  ...
```

So - open this files, we have tabs (it is style `0`):

```
1. accounts.py | 2. accounts.py | 3. accounts.py
```

It is problem, because we don't know which file open on tab 2! Now we've added a tab styles.

Set custom style for vim (for example - style 3):

```
echo "set tabline=%!TabName(3)" >> ~/.vimrc
```

Set custom style for neovim (for example - style 3):

```
echo "set tabline=%!TabName(3)" >> ~/.config/nvim/init.vim
```


### Style 1.

Show parent folder and filename. Show only parent folder, not full path to file.

```
1. models/accounts.py | 2. forms/accounts.py | 3. views/accounts.py
```

### Style 2.

Show only first and last symbol from parent folder and filename.

```
1. m..s/accounts.py | 2. f..s/accounts.py | 3. v..s/accounts.py
```

### Style 3.

Show only first symbol from parent folder and filename.

```
1. m/accounts.py | 2. f/accounts.py | 3. v/accounts.py
```

But if we have files:

```
myapp/
  models/
    accounts.py
  managers/
    accounts.py
```

Problem - `models` and `managers` starts with `m`.:

```
1. m/accounts.py | 2. m/accounts.py
```

### Style 4.

Show only three first symbol from parent folder + filename. But if the name of the parent directory is less or equal to 5 characters - it is displayed as full.

```
1. mod../accounts.py | 2. forms/accounts.py | 3. views/accounts.py
```

## Tab - autonomous life.

If you open 2-5 tabs - you have no problems. But if you have opened 25 tabs - it is a problem. All the tabs do not fit on the screen. Therefore, if you have more than 5 tabs open, and you begin to edit tab - the current tab automatically moves to the last position.

## License.

Copy, modify and use in anywhere!

*Please, leave the links to the original plugins and solutions that you use in your configurations. Respect the work of other developers!*
