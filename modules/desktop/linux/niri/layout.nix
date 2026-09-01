{ delib, rice, ... }:

delib.module {
  name = "desktop.niri";

  home.ifEnabled.wayland.windowManager.niri.settings.layout = {
    gaps = 16;
    center-focused-column = "never";
    background-color = rice.colors.background;

    default-column-width.proportion = 1.0;
    preset-column-widths._children = [
      { proportion = 1.0 / 3.0; }
      { proportion = 1.0 / 2.0; }
      { proportion = 2.0 / 3.0; }
    ];

    focus-ring = {
      width = 4;
      active-color = rice.colors.accent;
      inactive-color = rice.colors.inactive;
    };

    border = {
      off = { };
      width = 4;
      active-color = rice.colors.accentSoft;
      inactive-color = rice.colors.inactive;
      urgent-color = rice.colors.urgent;
    };
  };
}
