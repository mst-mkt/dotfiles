{
  delib,
  host,
  inputs,
  ...
}:

delib.module {
  name = "programs.nix-tools.nix-index";

  options = delib.singleEnableOption host.cliFeatured;

  home.always.imports = [ inputs.nix-index-database.homeModules.nix-index ];

  home.ifEnabled = {
    programs.nix-index.enable = true;
    programs.nix-index-database.comma.enable = true;
  };
}
