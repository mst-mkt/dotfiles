{
  delib,
  host,
  rice,
  ...
}:

delib.module {
  name = "desktop.cursor";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.home.pointerCursor = {
    enable = true;
    inherit (rice.cursor) name package size;
    gtk.enable = true;
    x11.enable = true;
  };
}
