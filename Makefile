SHELLCMDS :=.vim/cache/shellcmds.txt
.PHONY : $(SHELLCMDS)
$(SHELLCMDS) : SHELL :=/bin/bash
$(SHELLCMDS) :
	compgen -c | sort | uniq > $@
