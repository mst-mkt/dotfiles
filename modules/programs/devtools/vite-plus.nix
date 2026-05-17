{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "programs.devtools.vite-plus";

  options = delib.singleEnableOption host.devFeatured;

  home.ifEnabled.home.packages = [ pkgs.vite-plus ];
}
