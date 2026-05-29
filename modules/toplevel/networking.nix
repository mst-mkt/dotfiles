{ delib, host, ... }:

delib.module {
  name = "toplevel.networking";

  options = delib.singleEnableOption true;

  nixos.ifEnabled.networking = {
    hostName = host.name;
    networkmanager.enable = true;
    firewall.enable = true;
  };
}
