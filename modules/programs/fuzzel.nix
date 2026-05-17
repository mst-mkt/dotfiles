{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "programs.fuzzel";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.home.packages = [ pkgs.fuzzel ];
}
