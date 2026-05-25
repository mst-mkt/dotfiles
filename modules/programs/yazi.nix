{
  delib,
  host,
  ...
}:

delib.module {
  name = "programs.yazi";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled.programs.yazi = {
    enable = true;
    enableNushellIntegration = true;
  };
}
