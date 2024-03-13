{
  description = "0fie's ultra-simple NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors = { url = "github:misterio77/nix-colors"; };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hypridle = {
      url = "github:hyprwm/hypridle";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (import ./system/options.nix) hostName system;
      inherit (import ./home/options.nix) userName;

      allSystems = [
        "x86_64-linux" # 64-bit Intel/AMD Linux
      ];

      # Helper to provide system-specific attributes
      forAllSystems = f:
        nixpkgs.lib.genAttrs allSystems
        (system: f { pkgs = import nixpkgs { inherit system; }; });
    in {
      devShells = forAllSystems ({ pkgs }: {
        default = pkgs.mkShell {
          # The Nix packages provided in the environment
          packages = with pkgs; [ ];
        };
      });
      nixosConfigurations = {
        ${hostName} = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            inherit inputs;
          };
          modules = [
            ./system/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = { inherit inputs userName; };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.${userName} = import ./home/home.nix;
            }
          ];
        };
      };
    };

  nixConfig = {
    extra-substituters =
      [ "https://hyprland.cachix.org" "https://nix-community.cachix.org" ];
    extra-trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
}
