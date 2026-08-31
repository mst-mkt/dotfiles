{
  delib,
  host,
  pkgs,
  inputs,
  ...
}:

let
  nur-packages = inputs.nur-packages.packages.${pkgs.stdenv.hostPlatform.system};
in

delib.module {
  name = "programs.git-tools.rinkaku";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.ifEnabled.home.packages = [ nur-packages.rinkaku ];
}
