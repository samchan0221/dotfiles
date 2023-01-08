.DEFAULT_GOAL := all
UNAME ?= $(shell uname | tr '[:upper:]' '[:lower:]')

.PHONY: all

all:
	echo $(UNAME)
	nix build --no-link --experimental-features 'nix-command flakes' .#homeConfigurations.$(UNAME).activationPackage 
	home-manager switch --flake '.#$(UNAME)' --experimental-features 'nix-command flakes' -b backup
