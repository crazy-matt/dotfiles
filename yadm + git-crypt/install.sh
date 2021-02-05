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
# yadm unlock
# yadm cipher ".ssh/*"
# yadm cipher "!.ssh/known_hosts" # you want to prevent the encryption and commit of this file
# yadm add ".zshrc"
# yadm commit -m "test"
# yadm push
# open "https://github.com/$GITHUB_USER/dotfiles"
# yadm ls -e   # if you need to edit manually your encryption "registry"
