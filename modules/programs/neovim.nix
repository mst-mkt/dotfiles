{ delib, host, ... }:

delib.module {
  name = "programs.neovim";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  nixos.ifEnabled.programs.command-not-found.enable = false;

  home.ifEnabled.programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withRuby = false;
    withPython3 = false;
  };
}
