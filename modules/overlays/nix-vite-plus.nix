{ delib, inputs, ... }:

delib.overlayModule {
  name = "nix-vite-plus";
  overlay = inputs.nix-vite-plus.overlays.default;
  targets = [
    "nixos"
    "darwin"
  ];
  enabled = true;
}
