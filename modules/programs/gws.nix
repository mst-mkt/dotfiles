{
  delib,
  homeConfig,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "programs.gws";

  options = delib.singleEnableOption (host.isPersonal && host.cliFeatured && !host.isMobile);

  home.ifEnabled = {
    home.packages = [ pkgs.gws ];

    age.secrets.gws-client-secret = {
      file = ../../secrets/gws-client-secret.json.age;
      path = "${homeConfig.xdg.configHome}/gws/client_secret.json";
    };
  };
}
