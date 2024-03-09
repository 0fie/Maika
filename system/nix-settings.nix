{ config, pkgs, lib, ... }:

let inherit (import ../options.nix) userName system;
in {
  nix = {
    settings = {
      auto-optimise-store = true;
      trusted-users = [ "root" "${userName}" ];
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;

      # You don't wanna compile Hyprland from source, do you?
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };

    # Enable auto cleanup.
    gc = {
      automatic = true;
      persistent = true;
      dates = "daily";
      options = "--delete-older-than 1d";
    };
  };
}
