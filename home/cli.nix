{
  pkgs,
  lib,
  ...
}: {
  programs = {
    cava = {
      enable = true;
      settings = {
        general = {
          bar_spacing = 0;
          bar_width = 1;
        };
        color = {
          gradient = 1;
          gradient_color_1 = "'#8bd5ca'";
          gradient_color_2 = "'#91d7e3'";
          gradient_color_3 = "'#7dc4e4'";
          gradient_color_4 = "'#8aadf4'";
          gradient_color_5 = "'#c6a0f6'";
          gradient_color_6 = "'#f5bde6'";
          gradient_color_7 = "'#ee99a0'";
          gradient_color_8 = "'#ed8796'";
        };
      };
    };
    bat = {
      enable = true;
      config = {theme = "Catppuccin-mocha";};
      themes.Catppuccin-mocha = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
          sha256 = "sha256-6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
        };
        file = "Catppuccin-mocha.tmTheme";
      };
    };
    btop = {
      enable = true;
      settings = {
        color_theme = "catppuccin_mocha";
        vim_keys = true;
        rounded_corners = true;
      };
    };
  };
  # For Bat
  home.activation.buildBatCache = "${lib.getExe pkgs.bat} cache --build";

  # For Btop
  xdg.configFile."btop/themes/catppuccin_mocha.theme".text =
    builtins.readFile
    (pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "btop";
        rev = "ecb8562bb6181bb9f2285c360bbafeb383249ec3";
        sha256 = "sha256-ovVtupO5jWUw6cwA3xEzRe1juUB8ykfarMRVTglx3mk=";
      }
      + "/catppuccin_mocha.theme");
}
