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
    ++ lib.optionals host.isPersonal [ discord ]
    ++ lib.optionals host.iniadFeatured [ mattermost-desktop ];
}
