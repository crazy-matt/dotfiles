#--> naf - SHORT_HOST -
export SHORT_HOST="$(hostname | cut -d. -f1)"
#<-- naf - SHORT_HOST -

#--> naf - ZDOTDIR -
export ZDOTDIR="$HOME/.zsh-${SHORT_HOST}"
#<-- naf - ZDOTDIR -

#--> naf - zshenv-sourcing -
if [[ -n "${ZDOTDIR}" && "${ZDOTDIR}" != "$HOME" && -r "${ZDOTDIR}/.zshenv" ]]; then
  . "${ZDOTDIR}/.zshenv"
fi
#<-- naf - zshenv-sourcing -



#--> naf - zsh-startup-table -
#-------------------------------------------------------------
# Shell Startup Files Loading Order (Theory + NAF context)
#-------------------------------------------------------------
# interactive login => ssh server connection
# interactive, non-login => terminal opening
# non-interactive, non-login => script
#
# Bash startup files loading order:
# +----------------+-----------+-----------+------+
# |                |Interactive|Interactive|Script|
# |                |login      |non-login  |      |
# +----------------+-----------+-----------+------+
# |/etc/profile    |   A       |           |      |
# +----------------+-----------+-----------+------+
# |/etc/bash.bashrc|           |    A      |      |
# +----------------+-----------+-----------+------+
# |~/.bashrc       |           |    B      |      | sources ~/.zaliases in NAF config
# +----------------+-----------+-----------+------+
# |~/.bash_profile |   B1      |           |      | sources ~/.profile in NAF config
# +----------------+-----------+-----------+------+
# |~/.bash_login   |   B2      |           |      |
# +----------------+-----------+-----------+------+
# |~/.profile      |   B3      |           |      |
# +----------------+-----------+-----------+------+
# |BASH_ENV        |           |           |  A   |
# +----------------+-----------+-----------+------+
# |~/.bash_logout  |    C      |           |      |
# +----------------+-----------+-----------+------+
#
# Zsh startup files loading order:
# +----------------------------+-----------+-----------+------+
# |                            |Interactive|Interactive|Script|
# |                            |login      |non-login  |      |
# +----------------------------+-----------+-----------+------+
# |/etc/zshenv                 |    A      |    A      |  A   |
# +----------------------------+-----------+-----------+------+
# |~/.zshenv                   |    B      |    B      |  B   | sources ${ZDOTDIR}/.zshenv in NAF config
# +----------------------------+-----------+-----------+------+
# |/etc/zprofile               |    C      |           |      |
# +----------------------------+-----------+-----------+------+
# |~/.zprofile                 |    D      |           |      | sources ~/.profile in NAF config
# +----------------------------+-----------+-----------+------+
# |/etc/zshrc                  |    E      |    C      |      |
# +----------------------------+-----------+-----------+------+
# |~/.zshrc                    |    F      |    D      |      |
# +----------------------------+-----------+-----------+------+
# |${ZDOTDIR:-$HOME}/.zshrc    |    F      |    D      |      | sources ~/.zaliases, ~/.key_bindings in NAF config
# +----------------------------+-----------+-----------+------+
# |/etc/zlogin                 |    G      |           |      |
# +----------------------------+-----------+-----------+------+
# |~/.zlogin                   |    H      |           |      |
# +----------------------------+-----------+-----------+------+
# |~/.zlogout                  |    I      |           |      |
# +----------------------------+-----------+-----------+------+
# |/etc/zlogout                |    J      |           |      |
# +----------------------------+-----------+-----------+------+
# See => https://unix.stackexchange.com/a/487889/281672
# Summary => https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/
#<-- naf - zsh-startup-table -
