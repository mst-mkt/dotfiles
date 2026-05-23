{ delib, ... }:

delib.module {
  name = "programs.niri";

  home.ifEnabled.programs.niri.settings.overview = {
    backdrop-color = "#ffd200";
    zoom = 0.7;
    workspace-shadow = {
      softness = 60;
      spread = 6;
      offset = {
        x = 0;
        y = 10;
      };
      color = "#00000033";
    };
  };
}
