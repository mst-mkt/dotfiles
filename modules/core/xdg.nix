{ delib, pkgs, ... }:

delib.module {
  name = "core.xdg";

  options = delib.singleEnableOption pkgs.stdenv.hostPlatform.isLinux;

  home.ifEnabled.xdg.userDirs = {
    enable = true;
    createDirectories = true;
    setSessionVariables = false;
  };
}
