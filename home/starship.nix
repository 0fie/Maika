{ config, pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    settings = lib.importTOML (pkgs.fetchFromGitHub {
      owner = "0fie";
      repo = "trash";
      rev = "main";
      sha256 = "sha256-IrvJebWZCJh+SlZ72BPNqRzS7cgVgqZx1r0DKdLc5ZA=";
    } + "/starship.toml");
  };
}
