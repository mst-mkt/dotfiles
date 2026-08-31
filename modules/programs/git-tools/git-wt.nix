{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "programs.git-tools.git-wt";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.ifEnabled.home.packages = [ pkgs.git-wt ];
}
