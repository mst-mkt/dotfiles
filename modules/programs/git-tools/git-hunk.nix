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
  name = "programs.git-tools.git-hunk";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.ifEnabled.home.packages = [ nur-packages.git-hunk ];
}
