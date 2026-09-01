{ delib, ... }:

delib.host {
  name = "greenpath";
  type = "laptop";
  usage = "work";
  owner = "mst-mkt";
  system = "aarch64-darwin";
  features = [
    "dev"
    "gui"
  ];
  rice = "default";

  darwin.system.stateVersion = 7;
  home.home.stateVersion = "25.11";
}
