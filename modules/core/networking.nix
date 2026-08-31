{ delib, host, ... }:

delib.module {
  name = "core.networking";

  options = delib.singleEnableOption true;

  nixos.ifEnabled.networking = {
    hostName = host.name;
    networkmanager.enable = true;
    firewall.enable = true;
  };

  darwin.ifEnabled.networking = {
    hostName = host.name;
  };
}
