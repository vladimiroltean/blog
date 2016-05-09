#/bin/bash

mkdir -p ~/.dotfiles.old

mv ~/.bashrc.after        ~/.dotfiles.old
mv ~/.bash_aliases        ~/.dotfiles.old
mv ~/.gvimrc.after        ~/.dotfiles.old
mv ~/.vimrc               ~/.dotfiles.old
mv ~/.vimrc.keymaps       ~/.dotfiles.old
mv ~/.vimpagerrc          ~/.dotfiles.old
mv ~/.tmux.conf           ~/.dotfiles.old
mv ~/.tmux.compat.conf    ~/.dotfiles.old
mv ~/.tmux.keys.conf      ~/.dotfiles.old
mv ~/.tmux.mouse.conf     ~/.dotfiles.old
mv ~/.tmux.visual.conf    ~/.dotfiles.old
mv ~/.ssh                 ~/.ssh.old

cp ./.bashrc.after        ~
cp ./.bash_aliases        ~
cp ./.gvimrc.after        ~
cp ./.vimrc               ~
cp ./.vimrc.keymaps       ~
cp ./.vimpagerrc          ~
cp ./.tmux.conf           ~
cp ./.tmux.compat.conf    ~
cp ./.tmux.keys.conf      ~
cp ./.tmux.mouse.conf     ~
cp ./.tmux.visual.conf    ~
mkdir -p ~/.ssh/ && cp ./.ssh_config ~/.ssh/config
rsync -avr ./bin ~

echo -e \
"Please check that everything is ok, then press any key... \n
If there is any problem, please kill this process (Ctrl-c). You will \
find your old files inside ~/.dotiles.old and ~/.ssh.old. \n
If you continue, they will be deleted."
read

rm -r ~/.ssh.old
rm -r ~/.dotfiles.old
