{
  delib,
  host,
  lib,
  pkgs,
  ...
}:

delib.module {
  name = "core.home";

  options = delib.singleEnableOption true;

  home.ifEnabled = {
    home.username = lib.mkDefault host.owner;
    home.homeDirectory = lib.mkDefault (
      if pkgs.stdenv.hostPlatform.isDarwin then "/Users/${host.owner}" else "/home/${host.owner}"
    );

    programs.home-manager.enable = true;
  };
}
