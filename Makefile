all: backup install

backup:
	mkdir ~/.bck
	cp ~/.vimrc ~/.bashrc ~/.bck

install:
	cp vimrc ~/.vimrc
	cp bashrc ~/.bashrc
	cp -r vim/* ~/.vim
	cp -r bin/* ~/.local/bin/

