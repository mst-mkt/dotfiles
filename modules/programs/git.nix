{
  delib,
  host,
  constants,
  ...
}:

delib.module {
  name = "programs.git";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.ifEnabled.programs.git = {
    enable = true;
    settings.user = {
      name = constants.username;
      email = constants.useremail;
    };
  };
}
