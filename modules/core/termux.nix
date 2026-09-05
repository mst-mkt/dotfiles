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
  };
}
