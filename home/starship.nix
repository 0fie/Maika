{ config, pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    settings = lib.importTOML (pkgs.fetchFromGitHub {
      owner = "0fie";
      repo = "trash";
      rev = "main";
      sha256 = "sha256-4nUN++u8q2W7g5rmkYGEr9rb+fLERsrcXD8daWHw/9U=";
    } + "/starship.toml");
  };
}
