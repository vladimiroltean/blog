#/bin/bash

cp ~/.bashrc.after       .
cp ~/.bash_aliases       .
cp ~/.tmux.conf          .
cp ~/.tmux.compat.conf   .
cp ~/.tmux.keys.conf     .
cp ~/.tmux.mouse.conf    .
cp ~/.tmux.visual.conf   .
cp ~/.gvimrc.after       .
cp ~/.vimrc              .
cp ~/.vimrc.plug         .
cp ~/.vimrc.keymaps      .
cp ~/.vimpagerrc         .
cp ~/.ssh/config .ssh_config
rsync -avr ~/bin .

