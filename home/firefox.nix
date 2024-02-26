# TODO: Make Firefox use a Catppuccin theme. Declare bookmarks & settings.
{ config, pkgs, lib, ... }:

{
  programs.firefox = {
    enable = true;
    profiles = {
      me = {
        isDefault = true;
        name = "me";
        path = "me.default";
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
