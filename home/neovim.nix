{ pkgs, ... }:

{
  home.packages = with pkgs; [ neovim nixd lua-language-server ];
}
