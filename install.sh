#/bin/bash

mv ~/.bashrc.after        ~/.bashrc.after.old
mv ~/.bash_aliases        ~/.bash_aliases.old
mv ~/.gvimrc.after        ~/.gvimrc.after.old
mv ~/.vimrc.after         ~/.vimrc.after.old
mv ~/.vimrc.autocomplete  ~/.vimrc.autocomplete.old
mv ~/.vimrc.basic         ~/.vimrc.basic.old
mv ~/.vimrc.keymaps       ~/.vimrc.keymaps.old
mv ~/.vimrc.syntastic     ~/.vimrc.syntastic.old
mv ~/.vimrc.tags          ~/.vimrc.tags.old
mv ~/.vimpagerrc          ~/.vimpagerrc.old
mv ~/.tmux.conf           ~/.tmux.conf.old
mv ~/.tmux.compat.conf    ~/.tmux.compat.conf.old
mv ~/.tmux.keys.conf      ~/.tmux.keys.conf.old
mv ~/.tmux.mouse.conf     ~/.tmux.mouse.conf.old
mv ~/.tmux.visual.conf    ~/.tmux.visual.conf.old
mv ~/.ssh                 ~/.ssh.old

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
cp ./.tmux.compat.conf    ~
cp ./.tmux.keys.conf      ~
cp ./.tmux.mouse.conf     ~
cp ./.tmux.visual.conf    ~
mkdir -p ~/.ssh/ && cp ./.ssh_config ~/.ssh/config
rsync -avr ./bin ~
