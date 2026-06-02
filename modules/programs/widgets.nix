{
  delib,
  host,
  inputs,
  pkgs,
  ...
}:

delib.module {
  name = "programs.widgets";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.home.packages = [
    inputs.widgets.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
