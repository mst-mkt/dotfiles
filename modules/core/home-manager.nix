{
  delib,
  config,
  homeManagerUser,
  ...
}:

delib.module {
  name = "core.home-manager";

  options = delib.singleEnableOption true;

  myconfig.always.args = {
    nixos.homeConfig = config.home-manager.users.${homeManagerUser};
    darwin.homeConfig = config.home-manager.users.${homeManagerUser};
    droid.homeConfig = config.home-manager.config;
  };

  nixos.ifEnabled.home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-bak";
  };

  darwin.ifEnabled.home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-bak";
  };

  droid.ifEnabled.home-manager = {
    useGlobalPkgs = true;
    backupFileExtension = "hm-bak";
  };
}
