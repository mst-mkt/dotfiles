{ pkgs, inputs, ... }:

{
  imports = [ inputs.niri-flake.nixosModules.niri ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
