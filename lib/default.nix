inputs:
let
  inherit (inputs.nixpkgs) lib;

  defaultOverlays = [
    inputs.llm-agents.overlays.default
    inputs.niri-flake.overlays.niri
    inputs.nix-vite-plus.overlays.default
  ];
in
{
  mkSystem =
    {
      hostname,
      system,
      username,
      modules ? [ ],
      homeModules ? [ ],
      overlays ? defaultOverlays,
    }:
    let
      specialArgs = {
        inherit
          hostname
          inputs
          system
          username
          ;
      };
    in
    lib.nixosSystem {
      inherit system specialArgs;
      modules = [
        { nixpkgs.overlays = overlays; }
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "hm-bak";
            extraSpecialArgs = specialArgs;
            users.${username}.imports = homeModules;
          };
        }
      ]
      ++ modules;
    };
}
