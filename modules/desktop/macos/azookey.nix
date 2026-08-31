{ delib, host, ... }:

delib.module {
  name = "desktop.azookey";

  options = delib.singleEnableOption host.guiFeatured;

  darwin.ifEnabled.homebrew.casks = [ "azookey" ];
}
