#/bin/bash

INITDIR=$PWD
DOTFILES=$PWD/dotfiles
DOTFILES_OLD=$PWD/dotfiles.old

echo "====== Checking for junk left by previous runs of this tool."
if [ -d $DOTFILES_OLD ]; then
	echo -e \
	"Folder $DOTFILES_OLD already existing. Press Enter to delete and continue, or Ctrl-C to stop."
	read
	rm -rf $DOTFILES_OLD
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
echo "====== Finished copying new files"
echo -e "\n\n"
echo -e "====== WARNING!!! Please read!!! \n
Please check that everything is ok, then press any key... \n\
If there is any problem, please kill this process (Ctrl-c). \n\
You will find your old files inside $DOTFILES_OLD \n\
If you continue, they will be deleted."
read

rm -r $DOTFILES_OLD
