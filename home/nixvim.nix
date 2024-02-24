{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;

    plugins = {
      lualine.enable = true;
      neo-tree.enable = true;
      bufferline.enable = true;
      notify.enable = true;
      noice.enable = true;

      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
        };
      };

      dashboard = {
        enable = true;
	header = [ "Nixvim 🩵" ];
	footer = [ "To these types, complex software is the ideal." ];
	hideTabline = true;
	hideStatusline = true;
      };

      treesitter = {
        enable = true;
	ensure_installed = [ "nix" "vim" "regex" "lua" "bash" "markdown" "markdown_inline" ];
	indent= true;
      };
      
      nvim-cmp =  {
        enable = true;
	autoEnableSources = true;
	sources = [
	  { name = "nvim_lsp"; }
	  { name = "path"; }
	  { name = "buffer"; }
	];
	mapping = {
	  "<CR>" = "cmp.mapping.confirm({ select= true })";
	  "<TAB>" = {
	    action = ''cmp.mapping.select_next_item()'';
	    modes = [ "i" "s" ];
	  };
	};
      };
    };

    colorschemes.catppuccin = {
      enable= true;
      flavour = "mocha";
      terminalColors= true;
      transparentBackground= true;
    };


    clipboard.providers.wl-copy.enable = true;

    options = rec {
      number = true;         # Show line numbers
      relativenumber = true; # Show relative line numbers
      shiftwidth = 2;        # Tab width should be 2
      # clipboard = "unnamedplus";
      softtabstop = shiftwidth;
      smartindent = true;
      swapfile = false;
      backup = swapfile;
      scrolloff = 10;
    };
    
    keymaps = [
      {
        mode = "n";
        key = "<leader>f";
        options.silent = false;
        action = "<cmd>Neotree reveal right<CR>";
      }
    ];
    globals.mapleader = " "; # Sets the leader key to space.
  };
}
