{ delib, host, ... }:

delib.module {
  name = "programs.direnv";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled.programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableNushellIntegration = true;
    config.global.hide_env_diff = true;
  };
}
