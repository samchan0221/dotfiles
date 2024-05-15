.DEFAULT_GOAL := all
UNAME ?= $(shell uname | tr '[:upper:]' '[:lower:]')

hostname := samchan-macbook

LIGHT_GREEN := \033[0;32m
NC=\033[0m

.PHONY: darwin
darwin:
	@echo "$(LIGHT_GREEN)[DEBUG] Building...$(NC)"
	make build-darwin
	@echo "$(LIGHT_GREEN)[DEBUG] Switching...$(NC)"
	make switch-darwin

.PHONY: build-darwin
build-darwin:
	nix build --show-trace --extra-experimental-features 'nix-command flakes' .#darwinConfigurations.${hostname}.system

.PHONY: switch-darwin
switch-darwin:
	./result/sw/bin/darwin-rebuild switch --flake .#${hostname} --show-trace --verbose
