{ delib, ... }:

delib.module {
  name = "programs.niri";

  home.ifEnabled.programs.niri.settings.layout = {
    gaps = 16;
    center-focused-column = "never";
    empty-workspace-above-first = true;

    default-column-width.proportion = 1.0;
    preset-column-widths = [
      { proportion = 1.0 / 3.0; }
      { proportion = 1.0 / 2.0; }
      { proportion = 2.0 / 3.0; }
    ];

    focus-ring = {
      width = 4;
      active.color = "#7fc8ff";
      inactive.color = "#505050";
    };

    border = {
      enable = false;
      width = 4;
      active.color = "#ffc87f";
      inactive.color = "#505050";
      urgent.color = "#9b0000";
    };

    shadow = {
      softness = 30;
      spread = 5;
      offset = {
        x = 0;
        y = 5;
      };
      color = "#0007";
    };
  };
}
