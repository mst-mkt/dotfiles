{ delib, inputs, ... }:

delib.overlayModule {
  name = "llm-agents";
  overlay = inputs.llm-agents.overlays.shared-nixpkgs;
  targets = [
    "nixos"
    "darwin"
  ];
  enabled = true;
}
