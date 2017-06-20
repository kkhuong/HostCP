# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;91m\]\u@\h\[\033[00m\]:\[\033[01;96m\]\w\[\033[00m\]\$ '
LS_COLORS='di=1;96:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=1;92:*.rpm=90'
export LS_COLORS
