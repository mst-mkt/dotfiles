{ delib, inputs, ... }:

delib.overlayModule {
  name = "nix-vscode-extensions";
  overlay = inputs.nix-vscode-extensions.overlays.default;
  targets = [
    "nixos"
    "darwin"
  ];
  enabled = true;
}
