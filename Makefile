
pkgname := hyde-cli
prefix := /usr
bindir := $(prefix)/bin
libdir := $(prefix)/lib/$(pkgname)
etcdir := /etc/$(pkgname)
usrdir := $(prefix)/share/$(pkgname)
BACKUPDIR := $(shell mktemp -d)
VERSION := $(shell git describe --tags)
LAST_COMMIT := $(shell git log -1 --pretty=format:"%h %cd")
COMMIT_MESSAGE := $(shell git show -s --format='%B')
INSTALLATION_DIRECTORY := $(shell pwd)

ifdef LOCAL
    prefix := $(HOME)/.local
    bindir := $(prefix)/bin
    libdir := $(prefix)/lib/$(pkgname)
    etcdir := $(HOME)/.hyde-cli/
    usrdir := $(prefix)/share/$(pkgname)
endif

all: check directories  install

check:
	@which git >/dev/null || (echo "Error: git is not installed" && exit 1)

update:
	git fetch
	if [ "$(git rev-parse HEAD)" != "$(git rev-parse @{u})" ]; then \
		echo "Changes are available in the remote repository. Pulling changes..."; \
		git reset --hard; \
		git clean -fd; \
		git pull; \
	fi

directories:
	mkdir -p $(DESTDIR)$(bindir)
	mkdir -p $(DESTDIR)$(libdir)
	mkdir -p $(DESTDIR)$(etcdir)
	mkdir -p $(DESTDIR)$(usrdir)

	mkdir -p ${DESTDIR}$(prefix)/share/bash-completion/completions
	mkdir -p ${DESTDIR}$(prefix)/share/fish/vendor_completions.d
	mkdir -p ${DESTDIR}$(prefix)/share/zsh/site-functions

backup:

	mkdir -p $(BACKUPDIR)/bin
	mkdir -p $(BACKUPDIR)/scripts
	mkdir -p $(BACKUPDIR)/confs
	mkdir -p $(BACKUPDIR)/extras
	if [ -f $(DESTDIR)$(bindir)/Hyde ]; then \
	cp $(DESTDIR)$(bindir)/Hyde $(BACKUPDIR)/bin; \
	fi
		if [ -f $(DESTDIR)$(bindir)/Hyde-install ]; then \
	cp $(DESTDIR)$(bindir)/Hyde-install $(BACKUPDIR)/bin; \
	fi
	[ "$(ls -A $(DESTDIR)$(libdir))" ] && cp -r $(DESTDIR)$(libdir)/* $(BACKUPDIR)/scripts || true
	[ "$(ls -A $(DESTDIR)$(etcdir))" ] && cp -r $(DESTDIR)$(etcdir)/* $(BACKUPDIR)/confs || true
	[ "$(ls -A $(DESTDIR)$(usrdir))" ] && cp -r $(DESTDIR)$(usrdir)/* $(BACKUPDIR)/extras || true

install:
	install -m 755 ./Hyde $(DESTDIR)$(bindir) 
	install -m 755 ./Hyde-install $(DESTDIR)$(bindir)
	install -m 755 ./Hyde-tool $(DESTDIR)$(bindir) 

	install -m 644 ./shell-completions/Hyde.bash $(DESTDIR)$(bindir)/Hyde.bash 
	install -m 644 ./shell-completions/Hyde.zsh $(DESTDIR)$(bindir)/Hyde.zsh 
	install -m 644 ./shell-completions/Hyde-tool.bash $(DESTDIR)$(bindir)/Hyde-tool.bash 
	install -m 644 ./shell-completions/Hyde-tool.zsh $(DESTDIR)$(bindir)/Hyde-tool.zsh 

	@echo "Version: $(VERSION)" > $(DESTDIR)$(usrdir)/.$(pkgname).ver
	@echo "Last commit: $(LAST_COMMIT)" >> $(DESTDIR)$(usrdir)/.$(pkgname).ver
	@echo "Commit message: '$(COMMIT_MESSAGE)'" >> $(DESTDIR)$(usrdir)/.$(pkgname).ver

	# install -m 644 ./.$(pkgname).ver $(DESTDIR)$(usrdir) 

	install -m 755 ./Scripts/* $(DESTDIR)$(libdir) 
	install -m 644 ./Configs/* $(DESTDIR)$(etcdir) 
	install -m 644 ./Extras/* $(DESTDIR)$(usrdir) 
	
	install -m 644 ./shell-completions/Hyde.bash $(DESTDIR)$(usrdir)
	install -m 644 ./shell-completions/Hyde.zsh $(DESTDIR)$(usrdir)
	install -m 644 ./shell-completions/Hyde-tool.bash $(DESTDIR)$(usrdir)
	install -m 644 ./shell-completions/Hyde-tool.zsh $(DESTDIR)$(usrdir)


	install -m 644 ./shell-completions/Hyde.bash ${DESTDIR}$(prefix)/share/bash-completion/completions/Hyde
	install -m 644 ./shell-completions/Hyde.fish ${DESTDIR}$(prefix)/share/fish/vendor_completions.d/Hyde.fish
	install -m 644 ./shell-completions/Hyde.zsh ${DESTDIR}$(prefix)/share/zsh/site-functions/_Hyde

	install -m 644 ./shell-completions/Hyde-tool.bash ${DESTDIR}$(prefix)/share/bash-completion/completions/Hyde-tool
	install -m 644 ./shell-completions/Hyde-tool.fish ${DESTDIR}$(prefix)/share/fish/vendor_completions.d/Hyde-tool.fish
	install -m 644 ./shell-completions/Hyde-tool.zsh ${DESTDIR}$(prefix)/share/zsh/site-functions/_Hyde-tool

restore:
	make clean
	# Copy the backup files back to the configuration directory
	cp -r $(BACKUPDIR)/bin/* $(DESTDIR)$(bindir)
	cp -r $(BACKUPDIR)/scripts/* $(DESTDIR)$(libdir)
	cp -r $(BACKUPDIR)/confs/* $(DESTDIR)$(etcdir)
	cp -r $(BACKUPDIR)/extras/* $(DESTDIR)$(usrdir)

completion:
#?	exec: make completion
	@echo "Checking complgen is installed..."
	@complgen -h >/dev/null 2>&1 || (echo "ERROR: complgen is required, install using yay -S complgen."; exit 1)
	bash ./shell-completions/complgen.sh


uninstall: purge
clean: purge 
purge : 
	-rm -f $(wildcard $(DESTDIR)$(bindir)/Hyde)
	-rm -f $(wildcard $(DESTDIR)$(bindir)/Hyde-install)
	-rm -f $(wildcard $(DESTDIR)$(bindir)/Hyde-tool)

	-rm -f $(wildcard $(DESTDIR)$(bindir)/Hyde.bash)
	-rm -f $(wildcard $(DESTDIR)$(bindir)/Hyde.zsh)
	-rm -f $(wildcard $(DESTDIR)$(bindir)/Hyde-tool.bash) 
	-rm -f $(wildcard $(DESTDIR)$(bindir)/Hyde-tool.zsh)

	-rm -rf $(wildcard $(DESTDIR)$(libdir)/)
	-rm -rf $(wildcard $(DESTDIR)$(etcdir)/)
	-rm -rf $(wildcard $(DESTDIR)$(usrdir)/)

	-rm -f ${DESTDIR}$(prefix)/share/bash-completion/completions/Hyde
	-rm -f ${DESTDIR}$(prefix)/share/fish/vendor_completions.d/Hyde.fish
	-rm -f ${DESTDIR}$(prefix)/share/zsh/site-functions/_Hyde

	-rm -f ${DESTDIR}$(prefix)/share/bash-completion/completions/Hyde-tool
	-rm -f ${DESTDIR}$(prefix)/share/fish/vendor_completions.d/Hyde-tool.fish
	-rm -f ${DESTDIR}$(prefix)/share/zsh/site-functions/_Hyde-tool


old:

	-rm -f $(wildcard $(DESTDIR)$(bindir)/Hyprdots)
	-rm -f $(wildcard $(DESTDIR)$(bindir)/Hyprdots-install)
	-rm -rf $(wildcard $(DESTDIR)$(prefix)/lib/hyprdots-ctl/)
	-rm -rf $(wildcard $(DESTDIR)$(prefix)/etc/hyprdots-ctl/)
