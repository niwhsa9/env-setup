This repo contains the necessary configs and code to deploy my NixOS system configuration. Flakes are required to use this.

![screenshot](https://raw.githubusercontent.com/niwhsa9/env-setup/main/setup.png)


## NixOS usage
1. Enable flakes
2. Clone this repo
3. `cd` to `env-setup/nix`
3. `sudo nixos-rebuild switch --flake .`