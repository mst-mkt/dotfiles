{
  delib,
  host,
  inputs,
  pkgs,
  ...
}:

let
  widgets = inputs.widgets.packages.${pkgs.stdenv.hostPlatform.system};
in

delib.module {
  name = "desktop.widgets";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.home.packages = [ widgets.default ];
}
