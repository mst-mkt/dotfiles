{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "programs.wezterm";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled = {
    home.packages = [ pkgs.wezterm ];
    xdg.configFile."wezterm/wezterm.lua".source = ./wezterm.lua;
  };
}
