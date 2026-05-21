{
  delib,
  host,
  pkgs,
  lib,
  ...
}:

let
  setWallpaper = pkgs.writeShellScript "awww-set-wallpaper" ''
    until ${lib.getExe pkgs.awww} query >/dev/null 2>&1; do sleep 0.1; done
    exec ${lib.getExe pkgs.awww} img ${../../wallpapers/default.png}
  '';
in
delib.module {
  name = "services.wallpaper";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.systemd.user.services.awww = {
    Unit = {
      Description = "Wallpaper daemon (awww)";
      ConditionEnvironment = "WAYLAND_DISPLAY";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = lib.getExe' pkgs.awww "awww-daemon";
      ExecStartPost = "${setWallpaper}";
      Restart = "always";
      RestartSec = 10;
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
