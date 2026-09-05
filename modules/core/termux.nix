{
  delib,
  host,
  pkgs,
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
  };
}
