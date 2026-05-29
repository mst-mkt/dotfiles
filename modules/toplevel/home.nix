{ delib, constants, ... }:

delib.module {
  name = "toplevel.home";

  options = delib.singleEnableOption true;

  home.ifEnabled = {
    home.username = constants.username;
    home.homeDirectory = "/home/${constants.username}";

    programs.home-manager.enable = true;
  };
}
