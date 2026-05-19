{ delib, ... }:

delib.host {
  name = "dirtmouth";
  type = "laptop";

  nixos.system.stateVersion = "25.11";
}
