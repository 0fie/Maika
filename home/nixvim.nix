{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    plugins.lualine.enable = true;
    colorschemes.catppuccin = {
      enable= true;
      flavour = "mocha";
      terminalColors= true;
      transparentBackground= true;
    };
    options = {
      number = true;         # Show line numbers
      relativenumber = true; # Show relative line numbers
      shiftwidth = 2;        # Tab width should be 2
    };
  };
}
