{ delib, host, ... }:

delib.module {
  name = "programs.carapace";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled.programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
    ignoreCase = true;
  };
}
