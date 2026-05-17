{ delib, inputs, ... }:

delib.overlayModule {
  name = "niri-flake";
  overlay = inputs.niri-flake.overlays.niri;
  targets = [ "nixos" ];
  enabled = true;
}
