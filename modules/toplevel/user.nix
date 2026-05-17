{ delib, pkgs, ... }:

delib.module {
  name = "toplevel.user";

  options = delib.singleEnableOption true;

  nixos.ifEnabled =
    { myconfig, ... }:
    {
      environment.shells = [ pkgs.nushell ];

      users.users.${myconfig.constants.username} = {
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
