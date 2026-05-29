{ delib, ... }:

delib.module {
  name = "toplevel.home";

  options = delib.singleEnableOption true;

  home.ifEnabled =
    { myconfig, ... }:
    {
      home.username = myconfig.constants.username;
      home.homeDirectory = "/home/${myconfig.constants.username}";

      programs.home-manager.enable = true;
    };
}
