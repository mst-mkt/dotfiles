{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "programs.fastfetch";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled.home.packages = [ pkgs.fastfetch ];
}
