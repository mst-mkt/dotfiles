{ delib, host, ... }:

delib.module {
  name = "services.bluetooth";

  options = delib.singleEnableOption host.guiFeatured;

  nixos.ifEnabled.hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}
