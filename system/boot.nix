{
  boot = {
    loader.grub = {
      enable = true;
      device = "/dev/sda";
      timeoutStyle = "hidden";
      catppuccin.enable = true;
    };

    kernel.sysctl = {
      # Do not try to use swap space unless absolutely necessary.
      "vm.swappiness" = 0;

      # Speed up the initial connection establishment process in TCP connections.
      "net.ipv4.tcp_fastopen" = 3;

      # TCP congestion control.
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "cake";
    };

    # TCP congestion control.
    kernelModules = ["tcp_bbr"];
  };
}
