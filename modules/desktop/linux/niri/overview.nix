{ delib, ... }:

delib.module {
  name = "desktop.niri";

  home.ifEnabled.wayland.windowManager.niri.settings.overview = {
    backdrop-color = "#ffd200";
    zoom = 0.7;
    workspace-shadow = {
      softness = 60;
      spread = 6;
      offset._props = {
        x = 0;
        y = 10;
      };
      color = "#00000033";
    };
  };
}
