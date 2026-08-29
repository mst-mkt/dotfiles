{
  delib,
  host,
  lib,
  pkgs,
  ...
}:

delib.module {
  name = "programs.apps";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.home.packages =
    with pkgs;
    [
      vivaldi
      slack
    ]
    ++ lib.optional host.isPersonal discord
    ++ lib.optional host.iniadFeatured mattermost-desktop;
}
