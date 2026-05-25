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
    config.niri = {
      default = [ "gnome" ];
      "org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
      "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
    };
  };

  home.ifEnabled.xdg.configFile."xdg-desktop-portal-termfilechooser/config".text =
    lib.generators.toINI { } {
      filechooser = {
        cmd = "${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh";
        default_dir = "$HOME";
        env = "TERMCMD=wezterm start --always-new-process --class termfilechooser --";
        open_mode = "suggested";
        save_mode = "suggested";
      };
    };
}
