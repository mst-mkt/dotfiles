{
  delib,
  host,
  lib,
  pkgs,
  ...
}:

delib.module {
  name = "core.user";

  options = delib.singleEnableOption true;

  nixos.ifEnabled = {
    environment.shells = [ pkgs.nushell ];

    users.users.${host.owner} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "video"
      ];
      shell = pkgs.nushell;
    };
  };

  darwin.ifEnabled = {
    environment.shells = [ pkgs.nushell ];

    system.primaryUser = host.owner;

    users.users.${host.owner}.home = "/Users/${host.owner}";
  };

  droid.ifEnabled.user.shell = lib.getExe pkgs.nushell;
}
