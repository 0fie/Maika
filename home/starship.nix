{ config, pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    settings = lib.importTOML (pkgs.fetchFromGitHub {
      owner = "0fie";
      repo = "trash";
      rev = "main";
      sha256 = "sha256-QAN+60zXKAQurLoRmA3YZFBbv69ZW/Fe8jB1EgkQGB4=";
    } + "/starship.toml");
  };
}
