{
  description = "0fie's ultra-simple NixOS Configuration.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    mika.url = "github:0fie/Mika";

    izrss = {
      url = "github:isabelroses/izrss";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprlock.url = "github:hyprwm/hyprlock";
    hypridle.url = "github:hyprwm/hypridle";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (import ./system/options.nix) hostName system;
    inherit (import ./home/options.nix) userName;
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations."${userName}" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit inputs;};
      modules = [./home/home.nix];
    };

    nixosConfigurations."${hostName}" = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [./system/configuration.nix];
    };
  };
}
