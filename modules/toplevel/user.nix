{
  delib,
  constants,
  pkgs,
  ...
}:

delib.module {
  name = "toplevel.user";

  options = delib.singleEnableOption true;

  nixos.ifEnabled = {
    environment.shells = [ pkgs.nushell ];

    users.users.${constants.username} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "video"
      ];
      shell = pkgs.nushell;
    };
  };
}
