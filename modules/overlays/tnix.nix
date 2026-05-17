{ delib, inputs, ... }:

delib.overlayModule {
  name = "tnix";
  overlay = final: prev: {
    tnix = inputs.tnix.packages.${prev.system}.tnix;
    tnix-lsp = inputs.tnix.packages.${prev.system}.tnix-lsp;
  };
  targets = [ "nixos" ];
  enabled = true;
}
