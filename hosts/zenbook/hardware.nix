{ inputs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/hardware/cpu/intel-npu.nix")
    inputs.nixos-hardware.nixosModules.common-cpu-intel
  ];

  hardware.cpu.intel.npu.enable = true;
}
