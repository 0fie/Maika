{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;

    extraPlugins = with pkgs.vimPlugins; [
      base16-nvim
    ];

    # When writing a line of Lua code, start the line with 'lua'. 👇️
    extraConfigVim = ''
      colorscheme base16-catppuccin-mocha
      let s:guifont = "JetBrainsMono\\ Nerd\\ Font"

      lua vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
      lua vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

      lua vim.keymap.set({ "n", "i", "v" }, "<A-l>", vim.cmd.bnext, { desc = "Switch to next Buffer" })
      lua vim.keymap.set({ "n", "i", "v" }, "<A-h>", vim.cmd.bprev, { desc = "Switch to prev Buffer" })
      lua vim.keymap.set("n", "<C-q>", function() vim.cmd("bw"); end, { desc = "Close Buffer" })
    '';

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
      number = true;             # Show line numbers
      relativenumber = true;     # Show relative line numbers
      shiftwidth = 2;            # Tab width should be 2
      clipboard = "unnamedplus"; # Sync with OS clipboard
      softtabstop = shiftwidth;
      smartindent = true;
      swapfile = false;
      backup = swapfile;
      scrolloff = 10;
      cursorline = true;
    };
    
    keymaps = [
      {
        mode = "n";
        key = "<leader>f";
        action = "<cmd>Neotree toggle<CR>";
      }
    ];
    globals.mapleader = " "; # Sets the leader key to space.
  };
}
