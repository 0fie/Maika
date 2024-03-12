{ pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    settings = lib.importTOML (pkgs.fetchFromGitHub {
      owner = "0fie";
      repo = "trash";
      rev = "main";
      sha256 = "sha256-psXD7z1UecJo7E1ocFFWe3QDRVbaF+dDzhmuXtvsPo8=";
    } + "/starship.toml");
  };
}
