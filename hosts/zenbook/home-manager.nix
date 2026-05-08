{ username, ... }:

{
  imports = [
    ../../configs/home-manager/agents
    ../../configs/home-manager/cli-utilities
    ../../configs/home-manager/cursor
    ../../configs/home-manager/desktop-apps
    ../../configs/home-manager/dev-tools
    ../../configs/home-manager/fcitx5
    ../../configs/home-manager/gh
    ../../configs/home-manager/ghq
    ../../configs/home-manager/git
    ../../configs/home-manager/niri
    ../../configs/home-manager/nushell
    ../../configs/home-manager/wezterm
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
