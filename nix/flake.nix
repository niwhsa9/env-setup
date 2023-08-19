{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager.url = github:nix-community/home-manager;
  };

  outputs = { self, nixpkgs, ... } @ attrs : {
    nixosConfigurations.ashwin-desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [ ./configuration.nix ./hardware/desktop.nix ];
    };

    nixosConfigurations.ashwin-laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [ ./configuration.nix ./hardware/laptop.nix ];
    };

    overlays.default = import ./ashwin-nixpkgs/default.nix;

  };
}
