{
  delib,
  host,
  constants,
  inputs,
  pkgs,
  ...
}:

let
  gws = inputs.googleworkspace-cli.packages.${pkgs.stdenv.hostPlatform.system};
in

delib.module {
  name = "programs.gws";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled = {
    home.packages = [ gws.default ];

    age.secrets.gws-client-secret = {
      file = ../../secrets/gws-client-secret.json.age;
      path = "/home/${constants.username}/.config/gws/client_secret.json";
    };
  };
}
