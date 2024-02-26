# TODO: Implement Aylur's keybindings. Add grammars for more languages.
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
      nvim-autopairs.enable = true;

      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
	  tsserver.enable = true;
	  html.enable = true;
	  cssls.enable = true;
	  cmake.enable = true;
	  csharp-ls.enable = true;
	  jsonls.enable = true;
	  pyright.enable = true;
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
	ensureInstalled = [ "nix" "vim" "regex" "lua" "bash" "markdown" "markdown_inline" "c" "vimdoc" "python" "c-sharp"];
	indent= true;
	grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
	  nix vim regex lua bash markdown markdown_inline c vimdoc python c-sharp
	];
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
      clipboard = "unnamedplus";
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
        action = "<cmd>Neotree toggle<CR>";
      }
    ];
    globals.mapleader = " "; # Sets the leader key to space.
  };
}
