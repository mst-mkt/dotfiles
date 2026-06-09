{ delib, host, ... }:

delib.module {
  name = "services.upower";

  options = delib.singleEnableOption host.isLaptop;

  nixos.ifEnabled.services.upower.enable = true;
}
