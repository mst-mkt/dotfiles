{
  delib,
  host,
  lib,
  pkgs,
  ...
}:

delib.module {
  name = "programs.xdg-portal";

  options = delib.singleEnableOption host.guiFeatured;

  nixos.ifEnabled.xdg.portal = {
    extraPortals = [ pkgs.xdg-desktop-portal-termfilechooser ];
    config.niri."org.freedesktop.impl.portal.FileChooser" = lib.mkForce [ "termfilechooser" ];
  };

  home.ifEnabled.xdg.configFile."xdg-desktop-portal-termfilechooser/config".text =
    lib.generators.toINI { }
      {
        filechooser = {
          cmd = "${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh";
          default_dir = "$HOME";
          env = "TERMCMD=ghostty --class=termfilechooser -e";
          open_mode = "suggested";
          save_mode = "suggested";
        };
      };
}
