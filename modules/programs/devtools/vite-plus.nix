{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "programs.devtools.vite-plus";

  options = delib.singleEnableOption host.devFeatured;

  # disabled: upstream pnpmDeps hash broken (ryoppippi/nix-vite-plus#4)
  # home.ifEnabled.home.packages = [ pkgs.vite-plus ];
}
