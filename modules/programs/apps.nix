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
    [ slack ]
    ++ lib.optionals host.isPersonal [ discord ]
    ++ lib.optionals host.iniadFeatured [ mattermost-desktop ]
    ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux [ vivaldi ];
}
