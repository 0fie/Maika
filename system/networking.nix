{ ... }:

let inherit (import ./options.nix) hostName;

in {
  networking = {
    networkmanager.enable = true;
    hostName = "${hostName}";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 59010 59011 ];
      allowedUDPPorts = [ 59010 59011 ];
    };
  };
}
