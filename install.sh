#/bin/bash

INITDIR=$PWD
DOTFILES=$PWD/dotfiles
DOTFILES_OLD=$PWD/dotfiles.old

echo "====== Checking for junk left by previous runs of this tool."
if [ -d $DOTFILES_OLD ]; then
	read -p \
	"Folder $DOTFILES_OLD already existing. Do you want them deleted beforehand? [Y/n] " response
	if [ "$response" = "" ]; then
		response='Y'
	fi
	case $response in
	[yY][eE][sS]|[yY])
		echo "deleting"
		rm -r $DOTFILES_OLD
		;;
	esac
fi
mkdir -p $DOTFILES_OLD

echo "====== Backup any existing dotfiles."
cd $DOTFILES || echo "Must have dotfiles folder at $DOTFILES!"

for dotfile in `find . -type f`; do
	if [ -e $HOME/$dotfile ]; then
		test -d "$d" || mkdir -p `dirname $DOTFILES_OLD/$dotfile`
		mv -v $HOME/$dotfile $DOTFILES_OLD/$dotfile
	fi
done

echo "====== The way is cleared, copy all new files"
cd $INITDIR
# The "/" at the end makes a BIG difference
rsync -avr $DOTFILES/ $HOME

# Display warning
read -p "======  Your old dotfiles are located inside $DOTFILES_OLD. Would you like to keep them? [y/N] " response
if [ "$response" = "" ]; then
	response='N'
fi
case $response in
[nN][oO]|[nN])
	echo "deleting"
	rm -r $DOTFILES_OLD
	;;
esac

chmod 0700 ~/.ssh
chmod 0600 ~/.ssh/*
