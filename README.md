## Install nix
- [https://nixos.org/download.html](https://nixos.org/download.html)

## Add nix-channels
```
nix-channel --add https://github.com/NixOS/nixpkgs/archive/release-22.11.tar.gz nixpkgs
nix-channel --add https://github.com/nix-community/home-manager/archive/release-22.11.tar.gz home-manager
nix-channel --update
```

## Install home-manager
```
nix-shell '<home-manager>' -A install
```

## Apply config
```
make link
home-manager switch -b backup
```

