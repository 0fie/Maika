{inputs, ...}:
# This is kept in a separate file to allow you to copy the system/sys.nix file as it is.
{
  boot = {
    loader.grub = {
      enable = true;
      device = "/dev/sda";
      theme = inputs.catppuccin-grub + "/src/catppuccin-mocha-grub-theme";
    };

    kernel.sysctl = {
      "net.ipv4.tcp_fastopen" = 3;
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "cake";
    };

    kernelModules = ["tcp_bbr"];
  };
}
