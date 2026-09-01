{
  outputs =
    inputs:
    let
      forAllSystems = inputs.nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      treefmtFor =
        system:
        let
          pkgs = inputs.nixpkgs.legacyPackages.${system};
        in
        (inputs.treefmt-nix.lib.evalModule pkgs ./treefmt.nix).config.build.wrapper;

      extensions = with inputs.denix.lib.extensions; [
        args
        (base.withConfig (import ./denix/config.nix))
      ];
    in
    {
      nixosConfigurations = inputs.denix.lib.configurations {
        moduleSystem = "nixos";
        paths = [
          ./hosts/nixos
          ./modules
          ./rices
        ];
        exclude = [ ./modules/desktop/macos ];
        specialArgs = { inherit inputs; };
        inherit extensions;
      };

      darwinConfigurations = inputs.denix.lib.configurations {
        moduleSystem = "darwin";
        paths = [
          ./hosts/darwin
          ./modules
          ./rices
        ];
        exclude = [ ./modules/desktop/linux ];
        specialArgs = { inherit inputs; };
        inherit extensions;
      };

      nixOnDroidConfigurations = inputs.denix.lib.configurations {
        moduleSystem = "droid";
        paths = [
          ./modules
          ./rices
        ];
        exclude = [ ./modules/desktop ];
        specialArgs = { inherit inputs; };
        inherit extensions;
      };

      formatter = forAllSystems treefmtFor;

      checks = forAllSystems (system: {
        pre-commit = inputs.git-hooks.lib.${system}.run {
          src = ./.;
          hooks.treefmt = {
            enable = true;
            package = treefmtFor system;
          };
        };
      });

      devShells = forAllSystems (system: {
        default = inputs.nixpkgs.legacyPackages.${system}.mkShell {
          inherit (inputs.self.checks.${system}.pre-commit) shellHook;
          buildInputs = inputs.self.checks.${system}.pre-commit.enabledPackages;
        };
      });
    };

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    denix = {
      url = "github:mst-mkt/denix/feat/nix-on-droid";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
        nix-darwin.follows = "nix-darwin";
        nix-on-droid.follows = "nix-on-droid";
      };
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
    };
    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
    };
    ragenix = {
      url = "github:yaxitech/ragenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    git-hooks = {
      url = "github:cachix/git-hooks.nix";
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
    omniwm = {
      url = "github:mst-mkt/omniwm.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    moocs-collect-nix = {
      url = "github:mst-mkt/moocs-collect-nix";
    };
    cbhook = {
      url = "github:mst-mkt/cbhook";
    };
    autopair-nu = {
      url = "github:mst-mkt/autopair.nu";
    };
    serenity-emoji = {
      url = "github:mst-mkt/serenity-emoji";
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
    pi = {
      url = "github:lukasl-dev/pi.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ax = {
      url = "github:yusukebe/ax";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hunk = {
      url = "github:modem-dev/hunk";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    brew-nix = {
      url = "github:BatteredBunny/brew-nix";
      inputs = {
        brew-api.follows = "brew-api";
        nix-darwin.follows = "nix-darwin";
        nixpkgs.follows = "nixpkgs";
      };
    };
    brew-api = {
      url = "github:BatteredBunny/brew-api";
      flake = false;
    };

    pgbackup = {
      url = "github:flestudio/pgbackup";
    };
    misskey = {
      url = "github:flestudio/flestudio";
      flake = false;
    };
  };
}
