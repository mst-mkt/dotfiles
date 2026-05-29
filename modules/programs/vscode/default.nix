{ delib, host, ... }:

delib.module {
  name = "programs.vscode";

  options = delib.singleEnableOption (host.guiFeatured && host.devFeatured);

  home.ifEnabled.programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
  };
}
