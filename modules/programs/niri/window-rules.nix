{ delib, ... }:

delib.module {
  name = "programs.niri";

  home.ifEnabled.programs.niri.settings.window-rules = [
    {
      geometry-corner-radius = {
        top-left = 12.0;
        top-right = 12.0;
        bottom-left = 12.0;
        bottom-right = 12.0;
      };
      clip-to-geometry = true;
      draw-border-with-background = false;
    }
    {
      matches = [ { is-focused = true; } ];
      opacity = 0.8;
    }
    {
      matches = [ { is-focused = false; } ];
      opacity = 0.7;
    }
    {
      matches = [ { app-id = "^vivaldi-stable$"; } ];
      opacity = 1.0;
    }
    {
      matches = [ { app-id = ''^org\.wezfurlong\.wezterm$''; } ];
      default-column-width.proportion = 0.5;
    }
    {
      matches = [
        {
          app-id = "^$";
          title = "^$";
        }
      ];
      open-floating = true;
      default-floating-position = {
        x = 16;
        y = 16;
        relative-to = "bottom-right";
      };
      focus-ring.enable = false;
    }
  ];
}
