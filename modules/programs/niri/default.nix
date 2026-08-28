{
  delib,
  host,
  lib,
  pkgs,
  ...
}:

delib.module {
  name = "programs.niri";

  options = delib.singleEnableOption host.guiFeatured;

  nixos.ifEnabled = {
    programs.niri = {
      enable = true;
      useNautilus = false;
    };
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };

  home.ifEnabled.wayland.windowManager.niri = {
    enable = true;
    portalPackage = null;
    xwaylandSatellitePackage = null;

    settings = {
      prefer-no-csd = { };
      hotkey-overlay.skip-at-startup = { };
      screenshot-path = "~/Pictures/screenshots/%Y-%m-%d_%H-%M-%S.png";
      xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
    };
  };
}
