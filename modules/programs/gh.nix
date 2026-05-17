{ delib, host, ... }:

delib.module {
  name = "programs.gh";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled.programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
  };
}
