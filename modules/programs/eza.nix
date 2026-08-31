{ delib, host, ... }:

delib.module {
  name = "programs.eza";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled.programs.eza = {
    enable = true;
    enableNushellIntegration = true;
  };
}
