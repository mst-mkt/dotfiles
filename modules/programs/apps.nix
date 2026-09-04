{
  delib,
  host,
  inputs,
  lib,
  pkgs,
  ...
}:

let
  brew-casks = inputs.brew-nix.packages.${pkgs.stdenv.hostPlatform.system};
  vivaldi = if pkgs.stdenv.hostPlatform.isDarwin then brew-casks.vivaldi else pkgs.vivaldi;
in

delib.module {
  name = "programs.apps";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.home.packages =
    with pkgs;
    [
      slack
      vivaldi
    ]
    ++ lib.optionals host.isPersonal [ discord ]
    ++ lib.optionals host.iniadFeatured [ mattermost-desktop ];
}
