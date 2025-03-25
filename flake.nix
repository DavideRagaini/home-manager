{
  description = "Home Manager configuration of davide";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/nur";
    # firefox-addons = {
    #   url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, home-manager, nur, ... }@inputs:
    let
      username = "davide";
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations.${username} =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # modules = [ ./home.nix ];
          modules = [ ./home.nix ({ nixpkgs.overlays = [ nur.overlays.default ]; }) ];
        };
    };
}
