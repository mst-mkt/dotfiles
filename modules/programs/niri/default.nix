{
  delib,
  host,
  inputs,
  pkgs,
  ...
}:

delib.module {
  name = "programs.niri";

  options = delib.singleEnableOption host.guiFeatured;

  nixos.always.imports = [ inputs.niri-flake.nixosModules.niri ];

  nixos.ifEnabled = {
    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };

  home.ifEnabled.programs.niri.settings = {
    prefer-no-csd = true;
    hotkey-overlay.skip-at-startup = true;
    screenshot-path = "~/Pictures/screenshots/%Y-%m-%d_%H-%M-%S.png";
  };
}
