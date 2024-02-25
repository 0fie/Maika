{ config, pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    settings = lib.importTOML (pkgs.fetchFromGitHub {
      owner = "0fie";
      repo = "trash";
      rev = "main";
      sha256 = "sha256-ZxerPKmhaX0pWe3aNtZBZ0fpLDy4vPB3qGQe1cRRDn8=";
    } + "/starship.toml");
  };
}
