{ config, pkgs, lib, ... }:

{
  nix = {
    settings = {
      auto-optimise-store = true;
      trusted-users = [ "root" "me" ];
      experimental-features = [ "nix-command" "flakes" ];
    };

    # Enable auto cleanup.
    gc = {
      automatic = true;
      persistent = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  # Configure nixpkgs.
  nixpkgs.config = {
    allowUnfree = true;
    hostPlatform = lib.mkDefault "x86_64-linux";
  };
}
