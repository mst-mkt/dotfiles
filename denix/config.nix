{
  args.enable = true;
  hosts = {
    type.types = [
      "laptop"
      "server"
      "mobile"
    ];
    features = import ./features.nix;
    extraSubmodules = import ./extraSubmodules.nix;
  };
  rices.extraSubmodules = import ./riceSubmodules.nix;
}
