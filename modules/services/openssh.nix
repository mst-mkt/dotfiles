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
      listenAddresses = [
        {
          addr = "127.0.0.1";
          port = 22;
        }
        {
          addr = "[::1]";
          port = 22;
        }
      ];
      authorizedKeysInHomedir = false;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";
      };
    };

    users.users.${host.owner}.openssh.authorizedKeys.keys = lib.concatLists (lib.attrValues keys.users);
  };
}
