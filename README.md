# Install nix
- [https://nixos.org/download.html](https://nixos.org/download.html)

# Apply config
## Using nix flake
- WSL
```sh
nix build --no-link --experimental-features 'nix-command flakes' \
  'github:samchan0221/dotfiles#homeConfigurations.wsl.activationPackage'
```
```sh
$(nix path-info --experimental-features 'nix-command flakes' \
  'github:samchan0221/dotfiles#homeConfigurations.wsl.activationPackage)/activate'
```
- MacOS
```sh
nix build --no-link --experimental-features 'nix-command flakes' \
  'github:samchan0221/dotfiles#homeConfigurations.macOS.activationPackage'
```
```sh
$(nix path-info --experimental-features 'nix-command flakes' \
  'github:samchan0221/dotfiles#homeConfigurations.macOS.activationPackage)/activate'
```
## Cloning the repo
- WSL
```sh
make SYSTEM=wsl
```
- MacOS
```sh
make SYSTEM=macOS
```
