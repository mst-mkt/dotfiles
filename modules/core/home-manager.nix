{
  delib,
  config,
  homeManagerUser,
  ...
}:

delib.module {
  name = "core.home-manager";

  options = delib.singleEnableOption true;

  myconfig.always.args.shared = {
    homeConfig = config.home-manager.users.${homeManagerUser};
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
}
