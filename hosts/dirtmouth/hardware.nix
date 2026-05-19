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

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/cb99d20f-fa03-48d4-a33f-3e9f3dd086b1";
      fsType = "btrfs";
      options = [
        "subvol=root"
        "compress=zstd"
        "noatime"
      ];
    };

    fileSystems."/home" = {
      device = "/dev/disk/by-uuid/cb99d20f-fa03-48d4-a33f-3e9f3dd086b1";
      fsType = "btrfs";
      options = [
        "subvol=home"
        "compress=zstd"
        "noatime"
      ];
    };

    fileSystems."/nix" = {
      device = "/dev/disk/by-uuid/cb99d20f-fa03-48d4-a33f-3e9f3dd086b1";
      fsType = "btrfs";
      options = [
        "subvol=nix"
        "compress=zstd"
        "noatime"
      ];
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/C06A-F5AE";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    swapDevices = [
      { device = "/dev/disk/by-uuid/d645ba93-d03d-4c2a-8e61-5bade7d63a53"; }
    ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    hardware.cpu.intel.npu.enable = true;
  };
}
