{ delib, host, ... }:

delib.module {
  name = "programs.nix-tools.nix-ld";

  options = delib.singleEnableOption host.cliFeatured;

  nixos.ifEnabled.programs.nix-ld.enable = true;
}
