{ delib, pkgs, ... }:

delib.host {
  name = "crossroads";
  type = "server";
  system = "x86_64-linux";
  features = [ "dev" ];
  ssh = {
    hostname = "crossroads.fle.st";
    via = "cloudflared";
  };

  myconfig.services.misskey.enable = true;

  nixos = {
    system.stateVersion = "25.05";
    boot.kernelPackages = pkgs.linuxPackages_zen;
  };

  home.home.stateVersion = "24.11";
}
