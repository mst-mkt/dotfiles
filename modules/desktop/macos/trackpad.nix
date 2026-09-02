{ delib, host, ... }:

delib.module {
  name = "desktop.trackpad";

  options = delib.singleEnableOption host.guiFeatured;

  darwin.ifEnabled.system.defaults = {
    NSGlobalDomain = {
      "com.apple.trackpad.forceClick" = false;
    };

    trackpad = {
      Clicking = false;
    };
  };
}
