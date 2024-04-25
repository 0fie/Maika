{pkgs, ...}: {
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm = {
      enable = true;
      wayland = {
        enable = true;
        compositor = "kwin";
      };
    };
  };
  environment.plasma6.excludePackages = with pkgs.kdePackages; [kate dolphin elisa kwallet];
}
