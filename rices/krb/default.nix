{ delib, pkgs, ... }:

delib.rice {
  name = "krb";

  colors = {
    background = "#467586";
    backdrop = "#4fbfc0";
    accent = "#c44a55";
    accentSoft = "#a4e8e7";
    inactive = "#505050";
    urgent = "#f0c030";
  };

  wallpaper = {
    url = "https://wallpapers.keito.dev/akamikarubi.fanbox.cc/8038488/3840x2160.png";
    hash = "sha256-ZtQjtzKbbrP33nBuf6wEoWunjCkxMQbsEFskXd3G5Ys=";
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
