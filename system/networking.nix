{ config, pkgs, lib, ... }:

{
  networking = {
    networkmanager.enable = true;
    hostName = "nix";
    firewall = {
      enable = true;
      allowedTCPPorts = [];
      allowedUDPPorts = [];
    };
  };
}
