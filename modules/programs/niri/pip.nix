{
  delib,
  pkgs,
  lib,
  ...
}:

let
  pipTitle = "^(Picture(-| )in(-| )[Pp]icture|ピクチャー ?イン ?ピクチャー)$";
  pipFollow = pkgs.writers.writeNu "niri-pip-follow" {
    makeWrapperArgs = [
      "--prefix"
      "PATH"
      ":"
      (lib.makeBinPath [
        pkgs.niri
        pkgs.socat
      ])
    ];
  } ./pip-follow.nu;
in
delib.module {
  name = "programs.niri";

  home.ifEnabled = {
    programs.niri.settings.window-rules = [
      {
        matches = [ { title = pipTitle; } ];
        open-floating = true;
        min-width = 480;
        max-width = 480;
        min-height = 270;
        max-height = 270;
        default-floating-position = {
          x = 16;
          y = 16;
          relative-to = "bottom-right";
        };
        opacity = 1.0;
      }
    ];

    systemd.user.services.niri-pip-follow = {
      Unit = {
        Description = "Move the picture-in-picture window to the active workspace";
        PartOf = [ "graphical-session.target" ];
        After = [ "niri.service" ];
      };
      Service = {
        ExecStart = "${pipFollow} '${pipTitle}'";
        Restart = "always";
        RestartSec = 1;
      };
      Install.WantedBy = [ "graphical-session.target" ];
    };
  };
}
