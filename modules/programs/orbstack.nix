{
  delib,
  host,
  inputs,
  pkgs,
  ...
}:

let
  brew-casks = inputs.brew-nix.packages.${pkgs.stdenv.hostPlatform.system};
in

delib.module {
  name = "programs.orbstack";

  options = delib.singleEnableOption (host.name == "greenpath");

  home.ifEnabled.home.packages = [ brew-casks.orbstack ];
}
