{
  delib,
  host,
  lib,
  pkgs,
  ...
}:

delib.module {
  name = "core.termux";

  options = delib.singleEnableOption host.isMobile;

  home.ifEnabled = {
    home.file.".termux/termux.properties".text = lib.generators.toKeyValue { } {
      enforce-char-based-input = true;
    };
  };

  droid.ifEnabled = {
    terminal.font = "${pkgs.udev-gothic-nf}/share/fonts/truetype/UDEVGothicNFLG-Regular.ttf";

    android-integration = {
      termux-open.enable = true;
      termux-open-url.enable = true;
      termux-setup-storage.enable = true;
      termux-reload-settings.enable = true;
      xdg-open.enable = true;
    };
  };
}
