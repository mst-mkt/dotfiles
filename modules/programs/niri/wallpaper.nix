{
  delib,
  pkgs,
  lib,
  ...
}:

let
  setWallpaper = pkgs.writeShellScript "awww-set-wallpaper" ''
    until ${lib.getExe pkgs.awww} query >/dev/null 2>&1; do sleep 0.1; done
    exec ${lib.getExe pkgs.awww} img ${../../../wallpapers/default.png}
  '';
in
delib.module {
  name = "programs.niri";

  home.ifEnabled.programs.niri.settings.spawn-at-startup = [
    { command = [ (lib.getExe' pkgs.awww "awww-daemon") ]; }
    { command = [ "${setWallpaper}" ]; }
  ];
}
