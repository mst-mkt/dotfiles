{ ... }:

{
  programs.niri.settings.window-rules = [
    {
      matches = [ { app-id = ''^org\.wezfurlong\.wezterm$''; } ];
      default-column-width.proportion = 0.5;
    }
    {
      # Vivaldi popup windows
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
