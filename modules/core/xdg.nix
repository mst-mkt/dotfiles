{ delib, ... }:

delib.module {
  name = "core.xdg";

  options = delib.singleEnableOption true;

  home.ifEnabled.xdg.userDirs = {
    enable = true;
    createDirectories = true;
    setSessionVariables = false;
  };
}
