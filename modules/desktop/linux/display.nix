{ delib, host, ... }:

delib.module {
  name = "desktop.display";

  options = delib.singleEnableOption host.guiFeatured;

  nixos.ifEnabled = {
    services.libinput.enable = true;
    services.displayManager.ly.enable = true;
  };
}
