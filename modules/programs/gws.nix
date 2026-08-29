{
  delib,
  host,
  constants,
  pkgs,
  ...
}:

delib.module {
  name = "programs.gws";

  options = delib.singleEnableOption (host.isPersonal && host.cliFeatured);

  home.ifEnabled = {
    home.packages = [ pkgs.gws ];

    age.secrets.gws-client-secret = {
      file = ../../secrets/gws-client-secret.json.age;
      path = "/home/${constants.username}/.config/gws/client_secret.json";
    };
  };
}
