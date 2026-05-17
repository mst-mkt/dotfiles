{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "programs.ghq";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled = {
    home.packages = [ pkgs.ghq ];
    programs.git.settings.ghq.root = "~/_";
  };
}
