{ delib, ... }:

delib.module {
  name = "toplevel.home-manager";

  options = delib.singleEnableOption true;

  nixos.ifEnabled.home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-bak";
  };
}
