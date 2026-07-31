{
  delib,
  host,
  pkgs,
  inputs,
  ...
}:

delib.module {
  name = "programs.devtools.utilities";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.ifEnabled.home.packages = [
    inputs.ax.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.cf-open
    pkgs.gengo
    pkgs.git-hunk
    pkgs.git-wt
    pkgs.mo
  ];
}
