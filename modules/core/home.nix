{ delib, host, ... }:

delib.module {
  name = "core.home";

  options = delib.singleEnableOption true;

  home.ifEnabled = {
    home.username = host.owner;
    home.homeDirectory = "/home/${host.owner}";

    programs.home-manager.enable = true;
  };
}
