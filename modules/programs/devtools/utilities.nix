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
  nur-packages = inputs.nur-packages.packages.${pkgs.stdenv.hostPlatform.system};
in

delib.module {
  name = "programs.devtools.utilities";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.ifEnabled.home.packages = [
    ax.default
    cf-open.default
    nur-packages.calldiff
    nur-packages.gengo
    nur-packages.git-hunk
    nur-packages.rinkaku
    pkgs.git-wt
    pkgs.mo-viewer
  ];
}
