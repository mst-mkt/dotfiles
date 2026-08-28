{ delib, ... }:

delib.module {
  name = "programs.niri";

  home.ifEnabled.wayland.windowManager.niri.settings._children = [
    { spawn-at-startup._args = [ "widgets" ]; }
  ];
}
