{ delib, host, ... }:

delib.module {
  name = "programs.vscode";

  options = delib.singleEnableOption (host.devFeatured && host.guiFeatured);

  home.ifEnabled.programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
  };
}
