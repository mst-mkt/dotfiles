{ delib, pkgs, ... }:

delib.rice {
  name = "default";

  colors = {
    background = "#f8c706";
    backdrop = "#ffd200";
    accent = "#daa520";
    accentSoft = "#ffc87f";
    inactive = "#505050";
    urgent = "#9b0000";
  };

  wallpaper = {
    url = "https://wallpapers.keito.dev/_/mountain.png";
    hash = "sha256-lRlHCbRLuD6pvlQK2slaVme9P+jP/DqFftzviXIvUXQ=";
  };

  cursor = {
    name = "Breeze_Light";
    package = pkgs.kdePackages.breeze;
    size = 24;
  };

  iconTheme = {
    name = "Colloid";
    package = pkgs.colloid-icon-theme;
  };

  ghostty.theme = "Harper";
  vscode.colorTheme = "Dark Modern";
}
