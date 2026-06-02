{
  description = "mst-mkt's NixOS & home-manager configurations (denix-powered)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    denix.url = "github:yunfachi/denix";
    denix.inputs.nixpkgs.follows = "nixpkgs";
    denix.inputs.home-manager.follows = "home-manager";

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    nix-hazkey.url = "github:aster-void/nix-hazkey/4f791a241963f6804420d69613c25c6d25610e73";
    nix-hazkey.inputs.nixpkgs.follows = "nixpkgs";

    niri-flake.url = "github:sodiboo/niri-flake/very-refactor";
    niri-flake.inputs.nixpkgs.follows = "nixpkgs";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    nix-vite-plus.url = "github:ryoppippi/nix-vite-plus";
    nix-vite-plus.inputs.nixpkgs.follows = "nixpkgs";

    cf-open.url = "github:mst-mkt/cf-open";
    cf-open.inputs.nixpkgs.follows = "nixpkgs";

    widgets.url = "github:mst-mkt/widgets";
    widgets.inputs.nixpkgs.follows = "nixpkgs";

    moocs-collect-nix.url = "github:mst-mkt/moocs-collect-nix";

    cbhook.url = "git+ssh://git@github.com/mst-mkt/cbhook";
    cbhook.inputs.nixpkgs.follows = "nixpkgs";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";

    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";

    llm-agents.url = "github:numtide/llm-agents.nix";

    ragenix.url = "github:yaxitech/ragenix";
    ragenix.inputs.nixpkgs.follows = "nixpkgs";

    pgbackup.url = "github:flestudio/pgbackup";
    pgbackup.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      denix,
      ...
    }:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
      ];

      treefmtEval = forAllSystems (
        system: inputs.treefmt-nix.lib.evalModule nixpkgs.legacyPackages.${system} ./treefmt.nix
      );
    in
    {
      nixosConfigurations = denix.lib.configurations {
        moduleSystem = "nixos";
        homeManagerUser = "mst-mkt";
        paths = [
          ./hosts
          ./modules
        ];
        specialArgs = { inherit inputs; };
        extensions = with denix.lib.extensions; [
          args
          (base.withConfig {
            args.enable = true;
            hosts.type.types = [
              "laptop"
              "server"
            ];
            hosts.features = {
              features = [
                "cli"
                "gui"
                "dev"
                "game"
                "iniad"
                "misskey"
              ];
              defaultByHostType = {
                laptop = [
                  "cli"
                  "gui"
                ];
                server = [
                  "cli"
                ];
              };
            };
            hosts.extraSubmodules = [
              (
                { lib, ... }:
                {
                  options.ssh = {
                    hostname = lib.mkOption {
                      type = lib.types.nullOr lib.types.str;
                      default = null;
                    };
                    via = lib.mkOption {
                      type = lib.types.enum [
                        "direct"
                        "cloudflared"
                      ];
                      default = "direct";
                    };
                  };
                }
              )
            ];
          })
          overlays
        ];
      };

      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          wezterm-types = pkgs.fetchFromGitHub {
            owner = "DrKJeff16";
            repo = "wezterm-types";
            rev = "d3505f689e53d8fda536d265d870a1fee937e69f"; # v4.2.0-1
            hash = "sha256-4phaLDVFjH83D54lEMHin3b4ycgKUzdryjdv8u7tvNo=";
          };
        in
        {
          luarc = pkgs.writeText "luarc.json" (
            builtins.toJSON {
              "runtime.version" = "Lua 5.4";
              "workspace.library" = [ "${wezterm-types}/lua" ];
              "workspace.checkThirdParty" = false;
              "diagnostics.globals" = [ "wezterm" ];
            }
          );
        }
      );

      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            packages = [
              pkgs.nil
              treefmtEval.${system}.config.build.wrapper
            ];
            shellHook = ''
              ln -sfn ${self.packages.${system}.luarc} .luarc.json
            '';
          };
        }
      );

      formatter = forAllSystems (system: treefmtEval.${system}.config.build.wrapper);

      checks = forAllSystems (system: {
        formatting = treefmtEval.${system}.config.build.check self;
      });
    };
}
