{
  outputs =
    inputs:
    let
      forAllSystems = inputs.nixpkgs.lib.genAttrs [ "x86_64-linux" ];

    in
    {
      nixosConfigurations = inputs.denix.lib.configurations {
        moduleSystem = "nixos";
        homeManagerUser = "mst-mkt";
        paths = [
          ./hosts
          ./modules
        ];
        specialArgs = { inherit inputs; };
        extensions = with inputs.denix.lib.extensions; [
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
        ];
      };

      formatter = forAllSystems (system: inputs.nixpkgs.legacyPackages.${system}.nixfmt-tree);
    };

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    denix = {
      url = "github:yunfachi/denix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
    };
    ragenix = {
      url = "github:yaxitech/ragenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-flake = {
      url = "github:sodiboo/niri-flake/very-refactor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-hazkey = {
      url = "github:aster-void/nix-hazkey";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    widgets = {
      url = "github:mst-mkt/widgets";
    };
    cf-open = {
      url = "github:mst-mkt/cf-open";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vite-plus = {
      url = "github:ryoppippi/nix-vite-plus";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur-packages = {
      url = "github:mst-mkt/nur-packages";
    };
    moocs-collect-nix = {
      url = "github:mst-mkt/moocs-collect-nix";
    };
    cbhook = {
      url = "github:mst-mkt/cbhook";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    llm-agents = {
      url = "github:numtide/llm-agents.nix";
    };
    agent-skills = {
      url = "github:Kyure-A/agent-skills-nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    skills = {
      url = "git+ssh://git@github.com/mst-mkt/skills";
      flake = false;
    };
    claude-output-styles = {
      url = "git+https://gist.github.com/mst-mkt/591493bb7c12c8a5774b0ffe3d80d5cf";
      flake = false;
    };
    ccsession = {
      url = "github:sorafujitani/ccsession";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ax = {
      url = "github:yusukebe/ax";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pgbackup = {
      url = "github:flestudio/pgbackup";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    misskey = {
      url = "github:flestudio/flestudio";
      flake = false;
    };
  };
}
