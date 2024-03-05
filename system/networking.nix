{ config, pkgs, lib, ... }:

let inherit (import ../options/system/networking.nix) hostName;

in {
  networking = {
    networkmanager.enable = true;
    hostName = "NixOS";
    firewall = {
      enable = true;
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };
  };
}
