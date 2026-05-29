{ delib, host, ... }:

delib.module {
  name = "programs.neovim";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  nixos.ifEnabled.programs = {
    command-not-found.enable = false;

    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
  };
}
