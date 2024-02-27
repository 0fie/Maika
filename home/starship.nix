{ config, pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    settings = lib.importTOML (pkgs.fetchFromGitHub {
      owner = "0fie";
      repo = "trash";
      rev = "main";
      sha256 = "sha256-KWVe12znmNOFcYfDewxpZfh4T1Fz967W+yQJZbmKkNs";
    } + "/starship.toml");
  };
}
