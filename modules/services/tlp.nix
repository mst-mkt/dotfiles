{ delib, host, ... }:

delib.module {
  name = "services.tlp";

  options = delib.singleEnableOption host.isLaptop;

  nixos.ifEnabled = {
    services.tlp = {
      enable = true;
      settings.STOP_CHARGE_THRESH_BAT0 = 90;
    };
  };
}
