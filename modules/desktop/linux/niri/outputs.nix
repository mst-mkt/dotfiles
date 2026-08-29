{ delib, ... }:

delib.module {
  name = "desktop.niri";

  home.ifEnabled.wayland.windowManager.niri.settings._children = [
    {
      output = {
        _args = [ "eDP-1" ];
        scale = 1.75;
        position._props = {
          x = 0;
          y = 0;
        };
      };
    }
    {
      output = {
        _args = [ "LG Electronics 27EA33 310NDPHKL992" ];
        position._props = {
          x = -960;
          y = -1080;
        };
      };
    }
  ];
}
