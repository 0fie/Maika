{ inputs, lib, ... }:

let inherit (import ../home/options.nix) userName;
in {
  nix = {
    # pin the registry to avoid downloading and evaling a new nixpkgs version every time
    registry = lib.mapAttrs (_: v: { flake = v; }) inputs;

    settings = {
      auto-optimise-store = true;
      trusted-users = [ "${userName}" ];
      experimental-features = [ "nix-command" "flakes" ];
    };

    # Enable auto cleanup.
    # 0fie used Arch for so long, they no longer believe in rollbacks. We only roll forward!
    gc = {
      automatic = true;
      persistent = true;
      dates = "daily";
      options = "--delete-older-than 1d";
    };
  };

  nixpkgs.config = { allowUnfree = true; };
}
