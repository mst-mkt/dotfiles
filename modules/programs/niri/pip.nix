{
  delib,
  pkgs,
  lib,
  ...
}:

let
  genericPipTitles = [
    "Picture(-| )in(-| )[Pp]icture"
    "ピクチャー ?イン ?ピクチャー"
  ];
  meetPipTitle = "Meet - [a-z]{3}-[a-z]{4}-[a-z]{3}";
  anchor = alts: "^(${lib.concatStringsSep "|" alts})$";
  pipPosition = {
    x = 16;
    y = 16;
    relative-to = "bottom-right";
  };
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
    programs.niri.settings.window-rules = lib.mkAfter [
      {
        matches = [ { title = anchor genericPipTitles; } ];
        open-floating = true;
        min-width = 480;
        max-width = 480;
        min-height = 270;
        max-height = 270;
        default-floating-position = pipPosition;
        opacity = 1.0;
      }
      {
        matches = [
          {
            app-id = "^vivaldi-";
            title = anchor [ meetPipTitle ];
          }
        ];
        open-floating = true;
        default-column-width.fixed = 640;
        default-window-height.fixed = 360;
        default-floating-position = pipPosition;
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
        ExecStart = "${pipFollow} '${anchor (genericPipTitles ++ [ meetPipTitle ])}'";
        Restart = "always";
        RestartSec = 1;
      };
      Install.WantedBy = [ "graphical-session.target" ];
    };
  };
}
