{ pkgs ? import <nixpkgs> { overlays = [ (import ./default.nix) ]; } }:
    pkgs.mkShell {
        buildInputs = [
            pkgs.manif
        ]; 
    }
