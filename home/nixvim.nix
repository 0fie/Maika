{ config, pkgs, ... }:

{
  home.sessionVariables.EDITOR = "nvim";

  programs.nixvim = {
    enable = true;

    extraPlugins = with pkgs.vimPlugins; [
      base16-nvim
      vim-smoothie
      vim-prettier
      neoformat
    ];

    plugins = {
      lualine.enable = true;
      neo-tree.enable = true;
      bufferline.enable = true;
      notify.enable = true;
      noice.enable = true;
      nvim-autopairs.enable = true;
      nvim-colorizer.enable = true;
      nvim-lightbulb.enable = true;
      rainbow-delimiters.enable = true;
      lspkind.enable = true;

      gitsigns.enable = true;
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>l" = "live_grep";
        };
      };

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
        ensureInstalled = [
          "nix"
          "vim"
          "regex"
          "lua"
          "bash"
          "markdown"
          "markdown_inline"
          "c"
          "vimdoc"
          "python"
          "c-sharp"
        ];
        indent = true;
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          nix
          vim
          regex
          lua
          bash
          markdown
          markdown_inline
          c
          vimdoc
          python
          c-sharp
        ];
        nixGrammars = true;
      };

      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        sources =
          [ { name = "nvim_lsp"; } { name = "path"; } { name = "buffer"; } ];
        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select= true })";
          "<TAB>" = {
            action = "cmp.mapping.select_next_item()";
            modes = [ "i" "s" ];
          };
        };
      };
    };

    colorschemes.catppuccin = {
      enable = true;
      flavour = "mocha";
      terminalColors = true;
      transparentBackground = true;
    };

    clipboard.providers.wl-copy.enable = true;

    options = rec {
      number = true; # Show line numbers
      relativenumber = true; # Show relative line numbers
      shiftwidth = 2; # Tab width should be 2
      clipboard = "unnamedplus"; # Sync with OS clipboard
      softtabstop = shiftwidth;
      expandtab = true;
      smartindent = true;
      swapfile = false;
      backup = swapfile;
      scrolloff = 10;
      cursorline = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>t";
        action = "<cmd>Neotree toggle<CR>";
      }
      {
        mode = "n";
        key = "<leader>p";
        action = "<cmd>Neoformat<CR>";
      }
      {
        mode = "n";
        key = "<space>fb";
        action = ":Telescope file_browser<CR>";
        options.noremap = true;
      }
      {
        key = "<Tab>";
        action = ":bnext<CR>";
        options.silent = true;
      }
      {
        key = "<S-Tab>";
        action = ":bprev<CR>";
        options.silent = false;
      }
    ];

    globals.mapleader = " "; # Sets the leader key to space.

    extraConfigVim = # vim
      ''
        colorscheme base16-catppuccin-mocha
        let s:guifont = "JetBrainsMono\\ Nerd\\ Font"
        cmap w!! w !sudo tee > /dev/null %
        inoremap jk <ESC>

        let g:prettier#config#print_width = 2      
        let g:prettier#config#tab_width = 2
        let g:prettier#config#use_tabs = "true"

        augroup fmt
          autocmd!
          autocmd BufWritePre * undojoin | Neoformat
        augroup END
      '';

    extraConfigLua = # lua
      ''
        vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
        vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

        vim.keymap.set({ "n", "i", "v" }, "<A-l>", vim.cmd.bnext, { desc = "Switch to next Buffer" })
        vim.keymap.set({ "n", "i", "v" }, "<A-h>", vim.cmd.bprev, { desc = "Switch to prev Buffer" })
        vim.keymap.set("n", "<C-q>", function() vim.cmd("bw"); end, { desc = "Close Buffer" })

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
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
