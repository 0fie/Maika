{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [ neovim nixd lua-language-server ];
  #xdg.configFile."nvim".source = "${inputs.my-neovim}";
}
