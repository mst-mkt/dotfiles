{ delib, inputs, ... }:

delib.overlayModule {
  name = "nur";
  overlay = inputs.nur.overlays.default;
  targets = [
    "nixos"
    "darwin"
  ];
  enabled = true;
}
