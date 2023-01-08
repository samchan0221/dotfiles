# Install nix
- [https://nixos.org/download.html](https://nixos.org/download.html)

# Apply config
## Using nix flake
```sh
nix build --no-link --experimental-features 'nix-command flakes' --refresh \
  "github:samchan0221/dotfiles#homeConfigurations.$(uname | tr '[:upper:]' '[:lower:]').activationPackage"
```
```sh
$(nix path-info --experimental-features 'nix-command flakes' --refresh \
  "github:samchan0221/dotfiles#homeConfigurations.$(uname | tr '[:upper:]' '[:lower:]').activationPackage")/activate
```
## Cloning the repo
```sh
make
```
