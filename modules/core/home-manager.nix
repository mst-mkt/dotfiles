{ delib, ... }:

delib.module {
  name = "core.home-manager";

  options = delib.singleEnableOption true;

  nixos.ifEnabled.home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-bak";
  };
}
