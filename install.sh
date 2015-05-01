#/bin/bash

cp ./.profile      ~
cp ./.bashrc       ~
cp ./.bash_aliases ~
cp ./.vimrc.*      ~
cp ./.tmux.conf    ~
mkdir -p ~/.ssh/
cp ./.ssh_config ~/.ssh/config
rsync -avr ./bin ~
. ~/.bashrc
