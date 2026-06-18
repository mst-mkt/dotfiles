{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "programs.devtools.vite-plus";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.ifEnabled.home.packages = [ pkgs.vite-plus ];
}
