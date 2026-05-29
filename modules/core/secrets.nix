{
  delib,
  host,
  inputs,
  ...
}:

delib.module {
  name = "core.secrets";

  options = delib.singleEnableOption true;

  nixos.always.imports = [ inputs.ragenix.nixosModules.default ];

  nixos.ifEnabled = {
    age.identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

    environment.systemPackages = [
      inputs.ragenix.packages.${host.system}.default
    ];
  };
}
