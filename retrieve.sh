#/bin/bash

cp ~/.bashrc .
cp ~/.bash_aliases .
cp ~/.vimrc.after .
cp ~/.vimrc.basic .
cp ~/.vimrc.keymaps .
cp ~/.vimrc.syntastic .
cp ~/.vimrc.tags .
cp ~/.ssh/config .ssh_config
rsync -avr ~/bin .

