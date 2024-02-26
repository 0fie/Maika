# TODO: Make Firefox use a Catppuccin theme.
{ config, pkgs, lib, ... }:

{
  programs.firefox = {
    enable = true;
    profiles = {
      ff = {
        isDefault = true;
        name = "ff";
        path = "ff.default";
        # userChrome =  builtins.readFile (pkgs.fetchFromGitHub {
        #   owner = "0fie";
        #   repo = "trash";
        #   rev = "main";
        #   sha256 = "sha256-KWVe12znmNOFcYfDewxpZfh4T1Fz967W+yQJZbmKkNs=";
        # } + "/userChrome.css");
      };
    };
  };
}
