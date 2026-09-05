{
  delib,
  homeConfig,
  host,
  lib,
  pkgs,
  rice,
  ...
}:

let
  sessionTarget = homeConfig.wayland.systemd.target;
in
delib.module {
  name = "desktop.wallpaper";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.systemd.user.services.wallpaper = {
    Unit = {
      Description = "Set the wallpaper";
      PartOf = [ sessionTarget ];
      After = [ sessionTarget ];
    };
    Service = {
      ExecStart = "${lib.getExe pkgs.wbg} ${rice.wallpaper}";
      Restart = "on-failure";
    };
    Install.WantedBy = [ sessionTarget ];
  };
}
