{ delib, ... }:

delib.host {
  name = "zenbook";
  type = "laptop";

  nixos.system.stateVersion = "25.11";
}
