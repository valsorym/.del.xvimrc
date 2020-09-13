#!/bin/sh
# VALSORYM/XVIMRC INSTALL
# Author: valsorym <valsorym.e@gmail.com>

# Get base directory.
SCRIPT_DIR=`dirname $0`
cd $SCRIPT_DIR/../
BASE_DIR=`pwd -P`

# Copy the basic settings.
rm -Rf $HOME/.config/nvim/bundle \
       $HOME/.config/nvim/init.vim \
       $HOME/.config/nvim/ginit.vim
mkdir -p $HOME/.config/nvim/bundle
cp -Rf $BASE_DIR/vimrc/init.vim $HOME/.config/nvim/init.vim
cp -Rf $BASE_DIR/vimrc/ginit.vim $HOME/.config/nvim/ginit.vim

# Scan ~/.config/nvim/init.vim and find all plugins that must
# be installed use vundle.
PLUGINS=`cat $HOME/.config/nvim/init.vim | grep "Plugin '*'" | cut -d"'" -f2`
for plugin in $PLUGINS
do
    name=`echo $plugin | cut -d"/" -f2`
    echo "Processed: $name"
    git clone https://github.com/${plugin} $HOME/.config/nvim/bundle/$name
done

# Install fonts.
mkdir -p ~/.local/share/fonts && \
rm -Rf /tmp/editor-code-fonts/ && \
git clone https://github.com/valsorym/editor-code-fonts \
  /tmp/editor-code-fonts && \
cd /tmp/editor-code-fonts/fonts/ && \
cp ./* ~/.local/share/fonts/

# Install and setting plugins.
pip3 install --user --upgrade pynvim
nvim +PluginUpdate +qall
nvim +UpdateRemotePlugins +qall
nvim +GoInstallBinaries +qall

echo "Done!"
exit 0
