{ config, pkgs, ... }:

{
  home.sessionVariables.EDITOR = "nvim";

  programs.nixvim = {
    enable = true;

    extraPlugins = with pkgs.vimPlugins; [
      base16-nvim
    ];


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
	  eslint.enable = true;
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
    
    keymaps = [{
      mode = "n";
      key = "<leader>t";
      action = "<cmd>Neotree toggle<CR>";
    }];
    globals.mapleader = " "; # Sets the leader key to space.

    extraConfigVim = /* vim */ ''
      colorscheme base16-catppuccin-mocha
      let s:guifont = "JetBrainsMono\\ Nerd\\ Font"
      cmap w!! w !sudo tee > /dev/null %
    '';

    extraConfigLua = /* lua */ ''
      vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
      vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

      vim.keymap.set({ "n", "i", "v" }, "<A-l>", vim.cmd.bnext, { desc = "Switch to next Buffer" })
      vim.keymap.set({ "n", "i", "v" }, "<A-h>", vim.cmd.bprev, { desc = "Switch to prev Buffer" })
      vim.keymap.set("n", "<C-q>", function() vim.cmd("bw"); end, { desc = "Close Buffer" })

      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
      vim.keymap.set("n", "<space>f", vim.lsp.buf.format, { desc = "Format code" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
      vim.keymap.set("n", "<space>a", vim.lsp.buf.code_action, { desc = "Code action" })

      vim.keymap.set("n", "<space>d", vim.diagnostic.open_float, { desc = "Floating diagnostic" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
      vim.keymap.set("n", "gl", vim.diagnostic.setloclist, { desc = "Diagnostics on loclist" })
      vim.keymap.set("n", "gq", vim.diagnostic.setqflist, { desc = "Diagnostics on quickfix" })
    '';
  };
}
