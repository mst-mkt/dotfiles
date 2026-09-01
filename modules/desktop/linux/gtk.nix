{
  delib,
  host,
  rice,
  ...
}:

delib.module {
  name = "desktop.gtk";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.gtk = {
    enable = true;
    iconTheme = {
      inherit (rice.iconTheme) name package;
    };
  };
}
