{ delib, ... }:

delib.module {
  name = "programs.niri";

  home.ifEnabled.programs.niri.settings.outputs = {
    "eDP-1" = {
      scale = 1.75;
      position = {
        x = 0;
        y = 0;
      };
    };

    "LG Electronics 27EA33 310NDPHKL992" = {
      position = {
        x = -960;
        y = -1080;
      };
    };
  };
}
