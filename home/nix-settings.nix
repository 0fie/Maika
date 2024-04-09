{
  inputs,
  lib,
  pkgs,
  ...
}:
# Fetch the userName from our home/options.nix file. It will be used to add the user to Nix's "trusted-users" so that we can
# have additional rights when interacting with the Nix daemon.
{
  nix = {
    # Keep build-time dependencies around to be able to rebuild while being offline.
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';
    # Pin the registry to avoid downloading and evaling a new nixpkgs version every time.
    # I can not verify whether this works as intended.
    registry = lib.mapAttrs (_: v: {flake = v;}) inputs;
    settings = {
      auto-optimise-store = true;
      extra-substituters = ["https://hyprland.cachix.org"];
      extra-trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
    package = pkgs.nix;

    # Enable auto cleanup.
    # 0fie used Arch for so long, they don't believe in rollbacks. We only roll forward!
    gc = {
      automatic = true;
      frequency = "daily";
      options = "--delete-older-than 1d";
    };
  };

  nixpkgs.config.allowUnfree = true;
}
