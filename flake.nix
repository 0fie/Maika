{
  description = "0fie's ultra-simple NixOS Configuration.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    mika.url = "github:0fie/Mika";

    nix-colors.url = "github:misterio77/nix-colors";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hypridle = {
      url = "github:hyprwm/hypridle";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    catppuccin,
    ...
  } @ inputs: let
    inherit (import ./system/options.nix) hostName system;
    inherit (import ./home/options.nix) userName;
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations."${userName}" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit inputs;};
      modules = [
        catppuccin.homeManagerModules.catppuccin
        ./home/home.nix
      ];
    };

    nixosConfigurations."${hostName}" = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs system;};
      modules = [./system/configuration.nix];
    };
  };
}
