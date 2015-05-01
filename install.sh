#/bin/bash

cp ./.bash* ~
cp ./.vim* ~
mkdir -p ~/.ssh/
cp ./.ssh_config ~/.ssh/config
rsync -avr ./bin ~
. ~/.bashrc
