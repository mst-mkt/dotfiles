{ delib, ... }:

delib.module {
  name = "toplevel.xdg";

  options = delib.singleEnableOption true;

  home.ifEnabled.xdg.userDirs = {
    enable = true;
    createDirectories = true;
    setSessionVariables = false;
  };
}
