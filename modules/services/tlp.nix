{ delib, host, ... }:

delib.module {
  name = "services.tlp";

  options = delib.singleEnableOption host.isLaptop;

  nixos.ifEnabled.services.tlp.enable = true;
}
