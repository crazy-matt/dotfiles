#!/usr/bin/env zsh

brew update
brew install yadm
brew install git-crypt

./create-git-aliases.sh

source ./default.zaliases

echo "Explore!"


#
# Use case
#
# yadm_init "dotfiles"
# yadm cipher '!.ssh/known_hosts'   # => you want to prevent committing this, no worry it will be added in a .gitignore
# yadm cipher ".ssh/*"
# yadm add ".zshrc"
# yadm commit -m "test"
# yadm push
# yadm open   # => You'll see what is encrypted on the remote
# yadm ls -e   # => if you need to edit manually your encryption "registry"
