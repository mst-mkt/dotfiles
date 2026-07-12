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
    pkgs.ax
    pkgs.cf-open
    pkgs.gengo
    pkgs.git-hunk
    pkgs.git-wt
    pkgs.mo
  ];
}
