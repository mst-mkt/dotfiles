{ delib, host, ... }:

delib.module {
  name = "desktop.dock";

  options = delib.singleEnableOption host.guiFeatured;

  darwin.ifEnabled.system.defaults.dock = {
    autohide = true;
  };
}
