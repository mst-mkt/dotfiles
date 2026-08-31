{
  delib,
  host,
  pkgs,
  inputs,
  ...
}:

let
  vite-plus = inputs.nix-vite-plus.packages.${pkgs.stdenv.hostPlatform.system};
in

delib.module {
  name = "programs.vite-plus";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.ifEnabled.home.packages = [ vite-plus.default ];
}
