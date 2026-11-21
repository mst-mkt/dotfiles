{ delib, lib, ... }:

delib.module {
  name = "desktop.niri";

  home.ifEnabled = {
    wayland.windowManager.niri = {
      settings = {
        _children = lib.mkBefore [
          {
            layer-rule = {
              match._props.namespace = "^wallpaper$";
              place-within-backdrop = true;
            };
          }
          {
            window-rule = {
              geometry-corner-radius._args = [
                12
                12
                12
                12
              ];
              clip-to-geometry = true;
              draw-border-with-background = false;
              opacity = 0.6;
              background-effect = {
                blur = true;
                xray = false;
              };
            };
          }
          {
            window-rule = {
              match._props.app-id = "^vivaldi-stable$";
              opacity = 1.0;
            };
          }
          {
            window-rule = {
              match._props = {
                app-id = "^vivaldi-.*-Default$";
                title = "Twitch";
              };
              opacity = 1.0;
            };
          }
          {
            window-rule = {
              match._props = {
                app-id = "^$";
                title = "^$";
              };
              open-floating = true;
              default-floating-position._props = {
                x = 16;
                y = 16;
                relative-to = "bottom-right";
              };
            };
          }
        ];
      };
    };
  };
}
