{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "programs.devtools.utilities";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.ifEnabled.home.packages = [
    pkgs.cf-open
    pkgs.gengo
    pkgs.git-wt
    pkgs.mo
  ];
}
