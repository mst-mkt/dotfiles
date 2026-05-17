{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "programs.apps";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.home.packages = with pkgs; [
    vivaldi
    mattermost-desktop
    slack
    discord
  ];
}
