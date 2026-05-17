{ delib, host, ... }:

delib.module {
  name = "programs.git";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled =
    { myconfig, ... }:
    {
      programs.git = {
        enable = true;
        settings.user = {
          name = myconfig.constants.username;
          email = myconfig.constants.useremail;
        };
      };
    };
}
