{ delib, ... }:

delib.module {
  name = "toplevel.nix";

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
      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
        "https://niri.cachix.org"
        "https://moocs-collect-nix.cachix.org"
        "https://cache.numtide.com"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
        "moocs-collect-nix.cachix.org-1:MpREl4nnQpusRFLilrWt2S67SW1mLuqM6HvcirF/CjE="
        "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
      ];
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
}
