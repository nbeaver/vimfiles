SHELLCMDS :=.vim/cache/shellcmds.txt
.PHONY : $(SHELLCMDS)
$(SHELLCMDS) : SHELL :=/bin/bash
$(SHELLCMDS) :
	source ~/.profile && source ~/.bashrc && compgen -c | sort | uniq > $@

.PHONY : install
install : .vimrc .gvimrc
	cp -- $^ $(HOME)
