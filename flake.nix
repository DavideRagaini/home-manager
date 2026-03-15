{
  description = "Home Manager configuration of davide";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    winapps = {
      url = "github:winapps-org/winapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/nur";
    # firefox-addons = {
    #   url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, home-manager, nur, winapps, ... }@inputs:
    let
      username = "davide";
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations.${username} =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # modules = [ ./home.nix ];
          modules =
            [ ./home.nix ({ nixpkgs.overlays = [ nur.overlays.default ]; }) ];
        };

      nixosConfigurations.hostname = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";

        specialArgs = { inherit inputs system; };

        modules = [
          ./configuration.nix
          ({ pkgs, system ? pkgs.system, ... }: {
            environment.systemPackages = [
              winapps.packages."${system}".winapps
              winapps.packages."${system}".winapps-launcher # optional
            ];
          })
        ];
      };
    };

}
