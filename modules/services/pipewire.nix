{ delib, host, ... }:

delib.module {
  name = "services.pipewire";

  options = delib.singleEnableOption host.guiFeatured;

  nixos.ifEnabled = {
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
    };
  };
}
