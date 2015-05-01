#/bin/bash

cp ~/.profile         .
cp ~/.bashrc          .
cp ~/.bash_aliases    .
cp ~/.tmux.conf       .
cp ~/.vimrc.after     .
cp ~/.vimrc.basic     .
cp ~/.vimrc.keymaps   .
cp ~/.vimrc.syntastic .
cp ~/.vimrc.tags      .
cp ~/.ssh/config .ssh_config
rsync -avr ~/bin .

cp ~/.profile .
