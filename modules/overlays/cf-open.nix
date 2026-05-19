{ delib, inputs, ... }:

delib.overlayModule {
  name = "cf-open";
  overlay = final: _prev: {
    cf-open = inputs.cf-open.packages.${final.stdenv.hostPlatform.system}.default;
  };
  targets = [
    "nixos"
    "darwin"
  ];
  enabled = true;
}
