{
  delib,
  host,
  lib,
  ...
}:

let
  keys = import ../../secrets/keys.nix;
in

delib.module {
  name = "services.openssh";

  options = delib.singleEnableOption host.isServer;

  nixos.ifEnabled = {
    services.openssh = {
      enable = true;
      openFirewall = lib.mkDefault false;
    };

    users.users.${host.owner}.openssh.authorizedKeys.keys = lib.concatLists (lib.attrValues keys.users);
  };
}
