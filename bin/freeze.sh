#!/bin/sh
# Some packages of the vim evolve too quickly and require a reconfiguration
# of the vim's main configuration. To ensure that all packages will work
# correctly, this script rolls back the package's commit to the last
# working version.

# Deoplete
# Starting from the a39f78f commit package has problem:
cd ~/.vim/bundle/deoplete.nvim && git reset --hard 8249a0f

exit 0
