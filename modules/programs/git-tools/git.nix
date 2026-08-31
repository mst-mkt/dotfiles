{ delib, host, ... }:

delib.module {
  name = "programs.git-tools.git";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.ifEnabled.programs.git = {
    enable = true;
    settings.user = {
      name = "mst-mkt";
      email = "mail@keito.dev";
    };
    includes = [
      {
        condition = "gitdir:~/_/github.com/hatena/";
        contents = {
          user.email = "mst-mkt@hatena.com";
        };
      }
    ];
  };
}
