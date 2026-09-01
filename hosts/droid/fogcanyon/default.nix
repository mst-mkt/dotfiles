{ delib, ... }:

delib.host {
  name = "fogcanyon";
  type = "mobile";
  usage = "personal";
  owner = "mst-mkt";
  system = "aarch64-linux";
  rice = "default";

  droid = {
    system.stateVersion = "24.05";
    environment.etcBackupExtension = ".bak";
  };

  home.home.stateVersion = "26.05";
}
