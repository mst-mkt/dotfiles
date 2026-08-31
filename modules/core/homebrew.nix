{
  delib,
  host,
  inputs,
  ...
}:

delib.module {
  name = "core.homebrew";

  options = delib.singleEnableOption host.guiFeatured;

  darwin.always.imports = [ inputs.nix-homebrew.darwinModules.nix-homebrew ];

  darwin.ifEnabled = {
    homebrew.enable = true;

    nix-homebrew = {
      enable = true;
      user = host.owner;
      autoMigrate = false;
    };
  };
}
