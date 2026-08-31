{ delib, inputs, ... }:

delib.module {
  name = "core.disko";

  nixos.always.imports = [ inputs.disko.nixosModules.disko ];
}
