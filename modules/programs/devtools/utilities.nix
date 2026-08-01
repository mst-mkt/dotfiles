{
  delib,
  host,
  pkgs,
  inputs,
  ...
}:

let
  ax = inputs.ax.packages.${pkgs.stdenv.hostPlatform.system};
  cf-open = inputs.cf-open.packages.${pkgs.stdenv.hostPlatform.system};
in

delib.module {
  name = "programs.devtools.utilities";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.ifEnabled.home.packages = [
    ax.default
    cf-open.default
    pkgs.gengo
    pkgs.git-hunk
    pkgs.git-wt
    pkgs.mo-viewer
  ];
}
