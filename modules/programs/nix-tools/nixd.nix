{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "programs.nix-tools.nixd";

  options = delib.singleEnableOption host.devFeatured;

  home.ifEnabled.home.packages = [ pkgs.nixd ];
}
