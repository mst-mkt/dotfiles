{
  delib,
  lib,
  pkgs,
  ...
}:

let
  setWallpaper = pkgs.writeShellScript "awww-set-wallpaper" ''
    until ${lib.getExe pkgs.awww} query >/dev/null 2>&1; do sleep 0.1; done
    exec ${lib.getExe pkgs.awww} img ${../../../../wallpapers/default.png}
  '';
in
delib.module {
  name = "desktop.niri";

  home.ifEnabled.wayland.windowManager.niri.settings._children = [
    { spawn-at-startup._args = [ (lib.getExe' pkgs.awww "awww-daemon") ]; }
    { spawn-at-startup._args = [ "${setWallpaper}" ]; }
  ];
}
