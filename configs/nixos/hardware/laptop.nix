{ inputs, ... }:

{
  imports = [
    inputs.nixos-hardware.nixosModules.common-pc-laptop
    inputs.nixos-hardware.nixosModules.common-pc-laptop-ssd
  ];

  services.fstrim.enable = true;
  services.tlp.enable = true;
  services.angrr.enable = true;
}
