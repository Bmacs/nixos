{
    description = "NixOS config for nixos-desktop";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
        home-manager.url = "github:nix-community/home-manager/release-25.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        vicinae.url = "github:vicinaehq/vicinae";
        vicinae.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, home-manager, vicinae, ... }:
    let
        system = "x86_64-linux";
    in {
        nixosConfigurations.nixos-desktop = nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = { 
                inherit vicinae;
                inherit system;  # Pass system to modules that need it
            };
            modules = [
                ./hosts/nixos-desktop
                home-manager.nixosModules.home-manager
                {
                    nix.settings.experimental-features = [ "nix-command" "flakes" ];
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    # home-manager.users.bmacs = import ./home/bmacs.nix;  # uncomment when ready
                }
            ];
        };
    };
}

