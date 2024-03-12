{ ... }:

let inherit (import ../home/options.nix) userName;
in {
  nix = {
    settings = {
      auto-optimise-store = true;
      trusted-users = [ "root" "${userName}" ];
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };

    # Enable auto cleanup.
    gc = {
      automatic = true;
      persistent = true;
      dates = "daily";
      options = "--delete-older-than 1d";
    };
  };
  nixpkgs.config.allowUnfree = true;
}
