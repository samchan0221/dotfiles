NIXPKGS_SRC ?= https://github.com/NixOS/nixpkgs/archive/release-22.11.tar.gz
HOME_MANAGER_SRC ?= https://github.com/nix-community/home-manager/archive/release-22.11.tar.gz

.PHONY: link, unlink, setup

link:
	ln -s ${PWD}/nixpkgs ~/.config/nixpkgs

unlink:
	unlink ~/.config/nixpkg

setup:
	nix-channel --add $(NIXPKGS_SRC) nixpkgs
	nix-channel --add $(HOME_MANAGER_SRC) home-manager
	nix-channel --update
	nix-shell '<home-manager>' -A install
	mv ~/.config/nixpkgs ~/.config/nixpkgs.backup || true
	make link
	home-manager switch -b backup
