{ config, pkgs, lib, ... }:

{
  networking = {
    networkmanager.enable = true;
    hostName = "NixOS";
    firewall = {
      enable = true;
      allowedTCPPorts = [];
      allowedUDPPorts = [];
    };
  };
}
