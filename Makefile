.DEFAULT_GOAL := all
SYSTEM ?=

.PHONY: check-env, setup

.check-env:
ifndef SYSTEM
	$(error SYSTEM is undefined)
endif

all: .check-env
	nix build --no-link --experimental-features 'nix-command flakes' .#homeConfigurations.$(SYSTEM).activationPackage 
	home-manager switch --flake '.#$(SYSTEM)' --experimental-features 'nix-command flakes' -b backup
