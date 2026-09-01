{
  args.enable = true;
  hosts = {
    type.types = [
      "laptop"
      "server"
    ];
    features = import ./features.nix;
    extraSubmodules = import ./extraSubmodules.nix;
  };
  rices.extraSubmodules = import ./riceSubmodules.nix;
}
