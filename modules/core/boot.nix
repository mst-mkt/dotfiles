{ delib, ... }:

delib.module {
  name = "core.boot";

  options = delib.singleEnableOption true;

  nixos.ifEnabled = {
    boot.loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 20;
        consoleMode = "max";
        editor = false;
      };
      timeout = 0;
      efi.canTouchEfiVariables = true;
    };
  };
}
