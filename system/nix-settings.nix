{ ... }:

let inherit (import ../home/options.nix) userName;
in {
  nix = {
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
