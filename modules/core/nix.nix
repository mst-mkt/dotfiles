{ delib, ... }:

let
  substituters = [
    "https://cache.nixos.org"
    "https://nix-community.cachix.org"
    "https://moocs-collect-nix.cachix.org"
    "https://mst-mkt.cachix.org"
    "https://cache.numtide.com"
    "https://pi.cachix.org"
  ];

  trusted-public-keys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    "moocs-collect-nix.cachix.org-1:MpREl4nnQpusRFLilrWt2S67SW1mLuqM6HvcirF/CjE="
    "mst-mkt.cachix.org-1:Ap1WSTd2tPEsFkNutQ7+X8OGtv7kOy9Q+xzvBvcL7FU="
    "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
    "pi.cachix.org-1:lGeoGJaZ5ZDabuRzkcD5EBTNnDM4HJ1vqeOxlWk1Flk="
  ];
in

delib.module {
  name = "core.nix";

  options = delib.singleEnableOption true;

  nixos.ifEnabled = {
    nix.settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
      accept-flake-config = true;
      trusted-users = [
        "root"
        "@wheel"
      ];
      inherit substituters trusted-public-keys;
    };

    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    nix.optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };

    nixpkgs.config.allowUnfree = true;
  };

  darwin.ifEnabled = {
    nix.settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
      accept-flake-config = true;
      trusted-users = [
        "root"
        "@admin"
      ];
      inherit substituters trusted-public-keys;
    };

    nix.gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };

    nix.optimise.automatic = true;

    nixpkgs.config.allowUnfree = true;
  };
}
