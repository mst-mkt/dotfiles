{
  delib,
  host,
  inputs,
  pkgs,
  ...
}:

delib.module {
  name = "programs.gws";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled.home.packages = [
    inputs.googleworkspace-cli.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
