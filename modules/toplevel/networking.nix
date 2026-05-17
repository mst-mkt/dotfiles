{ delib, ... }:

delib.module {
  name = "toplevel.networking";

  options = delib.singleEnableOption true;

  nixos.ifEnabled =
    { myconfig, ... }:
    {
      networking = {
        hostName = myconfig.constants.hostname;
        networkmanager.enable = true;
        firewall.enable = true;
      };
    };
}
