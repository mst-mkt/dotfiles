{ pkgs, ... }:

{
  home.pointerCursor = {
    name = "Breeze_Light";
    package = pkgs.kdePackages.breeze;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}
