{
  delib,
  host,
  inputs,
  pkgs,
  ...
}:

delib.module {
  name = "toplevel.laptop";

  options = delib.singleEnableOption host.isLaptop;

  nixos.always.imports = [
    inputs.nixos-hardware.nixosModules.common-pc-laptop
    inputs.nixos-hardware.nixosModules.common-pc-laptop-ssd
  ];

  nixos.ifEnabled = {
    services.fstrim.enable = true;
    services.angrr.enable = true;

    environment.systemPackages = [ pkgs.brightnessctl ];
    services.udev.packages = [ pkgs.brightnessctl ];
  };
}
