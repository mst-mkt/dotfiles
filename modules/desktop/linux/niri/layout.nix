{ delib, ... }:

delib.module {
  name = "desktop.niri";

  home.ifEnabled.wayland.windowManager.niri.settings.layout = {
    gaps = 16;
    center-focused-column = "never";
    background-color = "#f8c706";

    default-column-width.proportion = 1.0;
    preset-column-widths._children = [
      { proportion = 1.0 / 3.0; }
      { proportion = 1.0 / 2.0; }
      { proportion = 2.0 / 3.0; }
    ];

    focus-ring = {
      width = 4;
      active-color = "#daa520";
      inactive-color = "#505050";
    };

    border = {
      off = { };
      width = 4;
      active-color = "#ffc87f";
      inactive-color = "#505050";
      urgent-color = "#9b0000";
    };
  };
}
