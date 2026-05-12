{ pkgs, ... }:

{
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  home.packages = with pkgs; [
    vivaldi
    waybar
    fuzzel
    mattermost-desktop
    slack
    discord
  ];
}
