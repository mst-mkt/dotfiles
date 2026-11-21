{
  delib,
  host,
  inputs,
  pkgs,
  ...
}:

delib.module {
  name = "core.laptop";

  options = delib.singleEnableOption host.isLaptop;

  nixos.always = {
    imports = [
      inputs.nixos-hardware.nixosModules.common-pc-laptop
      inputs.nixos-hardware.nixosModules.common-pc-laptop-ssd
    ];
  };

  nixos.ifEnabled = {
    services = {
      fstrim.enable = true;
      angrr.enable = true;

      logind.settings.Login.HandleLidSwitchExternalPower = "ignore";
      udev.packages = [ pkgs.brightnessctl ];
    };

    environment.systemPackages = [ pkgs.brightnessctl ];
  };
}
