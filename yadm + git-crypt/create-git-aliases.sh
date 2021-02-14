#!/usr/bin/env zsh

git config --global alias.cipher '!f() { zsh -c ". ${ZDOTDIR:-$HOME}/.zaliases; yadm_cipher \"$1\" "; }; f'
git config --global alias.decipher '!f() { zsh -c ". ${ZDOTDIR:-$HOME}/.zaliases; yadm_decipher \"$1\" "; }; f'
git config --global alias.ls '!f() { zsh -c ". ${ZDOTDIR:-$HOME}/.zaliases; yadm_ls \"$1\" "; }; f'
git config --global alias.unlock '!f() { zsh -c ". ${ZDOTDIR:-$HOME}/.zaliases; yadm_unlock \"$1\" "; }; f'
git config --global alias.open '!f() { open "$(yadm remote get-url origin)"; }; f'
git config --global alias.update '!f() { zsh -c "echo \"$(crontab -l)\" > ~/.crontab && yadm add ~/.crontab && yadm add -u && yadm commit -m \"$1\" && yadm push;"; }; f'
