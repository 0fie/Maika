{ pkgs, inputs, ... }:

let inherit (import ../home/options.nix) userName;
in {
  boot = {
    loader.grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = true;
    };
    plymouth = {
      enable = true;
      #font = "${inputs.trash}/fonts/Regular.ttf";
      font =
        "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";
      themePackages = [ pkgs.catppuccin-plymouth ];
      theme = "catppuccin-macchiato";
    };
  };
}
