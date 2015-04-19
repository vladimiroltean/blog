#/bin/bash

cp .bash* .vim* ~/
cp hosts /etc/
mkdir -p ~/.ssh/
cp .ssh_config ~/.ssh/config
. ~/.bashrc
