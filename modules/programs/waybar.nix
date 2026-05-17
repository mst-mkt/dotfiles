{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "programs.waybar";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.home.packages = [ pkgs.waybar ];
}
