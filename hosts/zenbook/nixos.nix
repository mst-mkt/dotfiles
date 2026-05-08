{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./hardware.nix

    ../../configs/nixos/core/boot.nix
    ../../configs/nixos/core/locale.nix
    ../../configs/nixos/core/network.nix
    ../../configs/nixos/core/nix.nix
    ../../configs/nixos/core/programs.nix
    ../../configs/nixos/core/users.nix

    ../../configs/nixos/desktop/display.nix
    ../../configs/nixos/desktop/fonts.nix
    ../../configs/nixos/desktop/niri.nix
    ../../configs/nixos/desktop/sound.nix
    ../../configs/nixos/desktop/steam.nix

    ../../configs/nixos/hardware/laptop.nix
  ];

  system.stateVersion = "25.11";
}
