{ delib, host, ... }:

delib.module {
  name = "programs.mako";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.services.mako.enable = true;
}
