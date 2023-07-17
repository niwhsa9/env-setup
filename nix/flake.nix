{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager.url = github:nix-community/home-manager;
    env-setup.url = "github:niwhsa9/env-setup";
    env-setup.flake = false;
  };

  outputs = { self, nixpkgs, ... } @ attrs : {
    nixosConfigurations.ashwin-desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [ ./configuration.nix ];
    };
  };
}
