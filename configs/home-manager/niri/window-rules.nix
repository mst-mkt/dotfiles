{ ... }:

{
  programs.niri.settings.window-rules = [
    {
      matches = [ { app-id = ''^org\.wezfurlong\.wezterm$''; } ];
      default-column-width.proportion = 0.5;
    }
  ];
}
