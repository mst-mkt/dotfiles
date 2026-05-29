{ delib, ... }:

delib.host {
  name = "dirtmouth";
  type = "laptop";
  system = "x86_64-linux";

  nixos.system.stateVersion = "25.11";
  home.home.stateVersion = "25.11";
}
