{
  delib,
  host,
  lib,
  pkgs,
  config,
  ...
}:

delib.module {
  name = "core.termux";

  options = delib.singleEnableOption host.isMobile;

  droid.ifEnabled = {
    terminal.font = "${pkgs.udev-gothic-nf}/share/fonts/truetype/UDEVGothicNFLG-Regular.ttf";

    android-integration = {
      termux-open.enable = true;
      termux-open-url.enable = true;
      termux-setup-storage.enable = true;
      termux-reload-settings.enable = true;
      xdg-open.enable = true;
    };

    build.activation.installTermuxProperties =
      let
        properties = pkgs.writeText "termux.properties" (
          lib.generators.toKeyValue { } {
            disable-file-share-receiver = true;
            disable-file-view-receiver = true;
            disable-terminal-session-change-toast = true;
            enforce-char-based-input = true;

            extra-keys = builtins.toJSON [
              [
                "ESC"
                "/"
                ":"
                ";"
                "-"
                "_"
                "KEYBOARD"
                "PASTE"
              ]
              [
                "TAB"
                "HOME"
                "END"
                "PGUP"
                "PGDN"
                "UP"
                "|"
                "~"
              ]
              [
                "CTRL"
                "ALT"
                "SHIFT"
                "BKSP"
                "LEFT"
                "DOWN"
                "RIGHT"
                "ENTER"
              ]
            ];

            terminal-cursor-style = "bar";
            terminal-margin-horizontal = 8;
            terminal-onclick-url-open = true;
            terminal-transcript-rows = 10000;
          }
        );
      in
      ''
        $DRY_RUN_CMD mkdir $VERBOSE_ARG -p "${config.user.home}/.termux"
        $DRY_RUN_CMD install $VERBOSE_ARG -m 0644 "${properties}" "${config.user.home}/.termux/termux.properties"
      '';
  };
}
