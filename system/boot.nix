{pkgs, ...}: {
  boot = {
    loader.grub = {
      enable = true;
      device = "/dev/sda";
      timeoutStyle = "hidden";
      theme =
        pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "grub";
          rev = "88f6124757331fd3a37c8a69473021389b7663ad";
          hash = "sha256-e8XFWebd/GyX44WQI06Cx6sOduCZc5z7/YhweVQGMGY=";
        }
        + "/src/catppuccin-mocha-grub-theme";
    };

    kernel.sysctl = {
      "net.ipv4.tcp_fastopen" = 3;
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "cake";
    };

    kernelModules = ["tcp_bbr"];
  };
}
