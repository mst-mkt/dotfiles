{
  delib,
  inputs,
  config,
  lib,
  modulesPath,
  ...
}:

delib.host {
  name = "dirtmouth";

  nixos = {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
      (modulesPath + "/hardware/cpu/intel-npu.nix")
      inputs.nixos-hardware.nixosModules.common-cpu-intel
    ];

    boot.initrd.availableKernelModules = [
      "xhci_pci"
      "thunderbolt"
      "vmd"
      "nvme"
      "usb_storage"
      "sd_mod"
    ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    hardware.cpu.intel.npu.enable = true;
  };
}
