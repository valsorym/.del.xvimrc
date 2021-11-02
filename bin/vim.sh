#!/bin/sh
# VALSORYM/XVIMRC INSTALL
# Author: valsorym <valsorym.e@gmail.com>

# Get base directory.
SCRIPT_DIR=`dirname $0`
cd $SCRIPT_DIR/../
BASE_DIR=`pwd -P`

# Copy the basic settings.
rm -Rf $HOME/.vim \
       $HOME/.vimrc \
       $HOME/.gvimrc
mkdir -p $HOME/.vim/bundle
cp -Rf $BASE_DIR/vimrc/init.vim $HOME/.vimrc
cp -Rf $BASE_DIR/vimrc/ginit.vim $HOME/.gvimrc

# Scan ~/.vimrc and find all plugins that must be installed use vundle.
PLUGINS=`cat $HOME/.vimrc | grep "Plugin '*'" | cut -d"'" -f2`
for plugin in $PLUGINS
do
    name=`echo $plugin | cut -d"/" -f2`
    echo "Processed: $name"
    git clone https://github.com/${plugin} $HOME/.vim/bundle/$name
done

# GoLang requirements.
go get -u github.com/segmentio/golines
go get -u github.com/jstemmer/gotags
go get -u golang.org/x/tools/cmd/guru
### go install mvdan.cc/gofumpt@latest

# Install fonts.
mkdir -p ~/.local/share/fonts && \
rm -Rf /tmp/editor-code-fonts/ && \
git clone https://github.com/valsorym/editor-code-fonts \
  /tmp/editor-code-fonts && \
cd /tmp/editor-code-fonts/fonts/ && \
cp ./* ~/.local/share/fonts/

# Install and setting plugins.
pip3 install --user --upgrade pynvim
vim +PluginUpdate +qall
vim +GoInstallBinaries +qall
vim +GoUpdateBinaries +qall

# Fix package version.
# Some packages of the vim evolve too quickly and require a reconfiguration
# of the vim's main configuration. To ensure that all packages will work
# correctly, this script rolls back the package's commit to the last
# working version.

# Deoplete
# Starting from the a39f78f commit package has problem:
cd $HOME/.vim/bundle/deoplete.nvim && git reset --hard 8249a0f

## # NerdTree
## # In recent versions, when NerdTree is selected, the cursor jumps to the
## # active file, not allowing you to select a new one (for a few seconds).
## cd $HOME/.vim/bundle/nerdtree && git reset --hard 1b19089

echo "Done!"
exit 0
