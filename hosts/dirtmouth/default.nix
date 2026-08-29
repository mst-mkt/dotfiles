{ delib, ... }:

delib.host {
  name = "dirtmouth";
  type = "laptop";
  usage = "personal";
  system = "x86_64-linux";
  features = [
    "dev"
    "game"
    "iniad"
  ];

  nixos.system.stateVersion = "25.11";
  home.home.stateVersion = "25.11";
}
