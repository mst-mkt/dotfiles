{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "desktop.gtk";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.gtk = {
    enable = true;
    iconTheme = {
      name = "Colloid";
      package = pkgs.colloid-icon-theme;
    };
  };
}
