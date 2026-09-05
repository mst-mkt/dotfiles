{
  delib,
  host,
  lib,
  pkgs,
  ...
}:

let
  moorOptions = {
    quit-if-one-screen = true;
    no-clear-on-exit = true;
    wrap = true;
    tab-size = 4;
  };

  env = {
    MOOR = lib.concatStringsSep " " (lib.cli.toCommandLineGNU { } moorOptions);
    PAGER = "moor --no-linenumbers";
  };
in

delib.module {
  name = "programs.moor";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled = {
    home.packages = [ pkgs.moor ];
    home.sessionVariables = env;
    programs.nushell.environmentVariables = env;
  };
}
