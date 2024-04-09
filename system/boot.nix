{
  boot = {
    loader.grub = {
      enable = true;
      device = "/dev/sda";
      timeoutStyle = "hidden";
      catppuccin.enable = true;
    };

    kernel.sysctl = {
      "net.ipv4.tcp_fastopen" = 3;
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "cake";
    };

    kernelModules = ["tcp_bbr"];
  };
}
