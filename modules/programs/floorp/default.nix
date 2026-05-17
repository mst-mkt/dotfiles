{ delib, host, ... }:

delib.module {
  name = "programs.floorp";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.programs.floorp = {
    enable = true;
    profiles.default = {
      isDefault = true;
      settings = {
        "extensions.autoDisableScopes" = 0;
        "extensions.enabledScopes" = 15;
      };
    };
  };
}
