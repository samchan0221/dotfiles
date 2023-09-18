.DEFAULT_GOAL := all
UNAME ?= $(shell uname | tr '[:upper:]' '[:lower:]')

LIGHT_GREEN := \033[0;32m
NC=\033[0m

.PHONY: all

all:
	@echo "$(LIGHT_GREEN)[DEBUG] Building home-manager...$(NC)"
	make build
	@echo "$(LIGHT_GREEN)[DEBUG] Switching config...$(NC)"
	make switch

build:
	nix build --no-link --experimental-features 'nix-command flakes' .#homeConfigurations.$(UNAME).activationPackage 

switch:
	$(shell nix path-info --refresh .#homeConfigurations.$(UNAME).activationPackage)/activate
