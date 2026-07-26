{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "programs.nix-tools.nixfmt";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.ifEnabled.home.packages = [ pkgs.nixfmt ];
}
