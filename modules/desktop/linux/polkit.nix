{ delib, host, ... }:

delib.module {
  name = "desktop.polkit";

  options = delib.singleEnableOption host.guiFeatured;

  nixos.ifEnabled.security.soteria.enable = true;
}
