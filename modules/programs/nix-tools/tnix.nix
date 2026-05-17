{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "programs.nix-tools.tnix";

  options = delib.singleEnableOption host.devFeatured;

  home.ifEnabled.home.packages = [
    pkgs.tnix
    pkgs.tnix-lsp
  ];
}
