{ delib, inputs, ... }:

delib.overlayModule {
  name = "llm-agents";
  overlay = inputs.llm-agents.overlays.default;
  targets = [
    "nixos"
    "darwin"
  ];
  enabled = true;
}
