BACKUP=~/.bck

all: backup install

backup:
	cp ~/.vimrc ~/.vimrc.bk
	cp ~/.bashrc ~/.bashrc.bk

install:
	cp vimrc ~/.vimrc
	cp bashrc ~/.bashrc
	cp -r vim/* ~/.vim
	cp -r bin/* ~/.local/bin/

