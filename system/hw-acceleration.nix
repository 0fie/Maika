{ pkgs, ... }:

{
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };

    opengl = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vaapi
        Intel
        vaapi
        Vdpau
        lib
        vdpau-va-gl
      ];
      driSupport = true;
      driSupport32Bit = true;
    };
  };
}
