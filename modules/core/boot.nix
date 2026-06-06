{ delib, ... }:

delib.module {
  name = "core.boot";

  options = delib.singleEnableOption true;

  nixos.ifEnabled = {
    boot.loader.systemd-boot = {
      enable = true;
      configurationLimit = 20;
      consoleMode = "max";
    };
    boot.loader.timeout = 0;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
