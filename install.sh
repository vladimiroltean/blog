#/bin/bash

cp ./.bashrc.after        ~
cp ./.bash_aliases        ~
cp ./.gvimrc.after        ~
cp ./.vimrc.after         ~
cp ./.vimrc.autocomplete  ~
cp ./.vimrc.basic         ~
cp ./.vimrc.keymaps       ~
cp ./.vimrc.syntastic     ~
cp ./.vimrc.tags          ~
cp ./.vimpagerrc          ~
cp ./.tmux.conf           ~
mkdir -p ~/.ssh/ && cp ./.ssh_config ~/.ssh/config
rsync -avr ./bin ~
