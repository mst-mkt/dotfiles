{
  delib,
  pkgs,
  lib,
  ...
}:

delib.module {
  name = "programs.niri";

  home.ifEnabled.programs.niri.settings = {
    xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite-unstable;

    spawn-at-startup = [
      { command = [ "waybar" ]; }
      {
        command = [
          "fcitx5"
          "-d"
          "-r"
        ];
      }
    ];
  };
}
