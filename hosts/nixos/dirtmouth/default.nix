{ delib, ... }:

delib.host {
  name = "dirtmouth";
  type = "laptop";
  usage = "personal";
  owner = "mst-mkt";
  system = "x86_64-linux";
  features = [
    "dev"
    "game"
    "iniad"
  ];
  rice = "default";

  nixos.system.stateVersion = "25.11";
  home.home.stateVersion = "25.11";
}
