{ ... }:

let inherit (import ./options.nix) hostName;

in {
  networking = {
    networkmanager.enable = true;
    hostName = "${hostName}";
    firewall = {
      enable = true;
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };
  };
}
