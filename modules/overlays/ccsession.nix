{ delib, inputs, ... }:

delib.overlayModule {
  name = "ccsession";
  overlay = final: _prev: {
    ccsession = inputs.ccsession.packages.${final.stdenv.hostPlatform.system}.default;
  };
  targets = [
    "nixos"
    "darwin"
  ];
  enabled = true;
}
