{
  delib,
  host,
  constants,
  ...
}:

let
  keys = import ../../secrets/keys.nix;
in

delib.module {
  name = "services.openssh";

  options = delib.singleEnableOption host.isServer;

  nixos.ifEnabled = {
    services.openssh.enable = true;

    users.users.${constants.username}.openssh.authorizedKeys.keys = keys.users.${constants.username};
  };
}
