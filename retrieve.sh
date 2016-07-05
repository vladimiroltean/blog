#/bin/bash

DOTFILES=$PWD/dotfiles

# For each dotfile in our folder, retrieve the currently running version from the system instead.
cd $DOTFILES || echo "Must have dotfiles folder at $DOTFILES!"

echo "====== Retrieving dotfiles from running system."
for dotfile in `find . -type f`; do
	if [ -e $HOME/$dotfile ]; then
		cp -v $HOME/$dotfile $DOTFILES/$dotfile
	fi
done

rsync -avr $HOME/bin/ $DOTFILES/bin
