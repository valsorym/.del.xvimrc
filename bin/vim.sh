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

# Install and setting plugins.
vim +PluginUpdate +qall

echo "Done!"
exit 0
