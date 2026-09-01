{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "core.xdg";

  options = delib.singleEnableOption (pkgs.stdenv.hostPlatform.isLinux && !host.isMobile);

  home.ifEnabled.xdg.userDirs = {
    enable = true;
    createDirectories = true;
    setSessionVariables = false;
  };
}
