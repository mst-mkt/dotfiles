{ delib, ... }:

delib.module {
  name = "desktop.niri";

  home.ifEnabled.wayland.windowManager.niri.settings.input = {
    keyboard = {
      xkb.layout = "jp";
      numlock = { };
    };

    touchpad = {
      tap = { };
      natural-scroll = { };
      dwt = { };
    };

    focus-follows-mouse._props.max-scroll-amount = "100%";

    workspace-auto-back-and-forth = { };
  };
}
