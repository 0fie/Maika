# Fetches the hostName from our system/options.nix file.
let
  inherit (import ./options.nix) hostName;
in {
  networking = {
    networkmanager.enable = true;
    hostName = "${hostName}";
    firewall = {
      enable = true;
      # The allowed ports below are for SoundWireServer. If you don't use it, you can safely remove them.
      allowedTCPPorts = [59010 59011 4381];
      allowedUDPPorts = [59010 59011 4381];
    };
  };
}
