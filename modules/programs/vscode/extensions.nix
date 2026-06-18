{ delib, pkgs, ... }:

delib.module {
  name = "programs.vscode";

  home.ifEnabled =
    let
      tnix = pkgs.vscode-utils.buildVscodeMarketplaceExtension {
        mktplcRef = {
          publisher = "ubugeeei";
          name = "tnix";
          version = "0.5.0";
        };
        vsix = pkgs.fetchurl {
          url = "https://github.com/ubugeeei/tnix/releases/download/v0.5.0/tnix-vscode-v0.5.0.vsix";
          hash = "sha256-bXIGClx5CN5SLciZ+Dk7CqLN6zPSwxYgq3zrsCIIHzA=";
        };
      };
    in
    {
      programs.vscode.profiles.default.extensions =
        (with pkgs.vscode-extensions; [
          charliermarsh.ruff
          github.copilot-chat
          golang.go
          ibm.output-colorizer
          jnoortheen.nix-ide
          mkhl.direnv
          ms-python.python
          ms-toolsai.jupyter
          nefrob.vscode-just-syntax
          rust-lang.rust-analyzer
          streetsidesoftware.code-spell-checker
          sumneko.lua
          tamasfe.even-better-toml
          thenuprojectcontributors.vscode-nushell-lang
          usernamehw.errorlens
          vitest.explorer
          yoavbls.pretty-ts-errors
        ])
        ++ (with pkgs.vscode-marketplace-release-universal; [
          antfu.unocss
          ionutvmi.path-autocomplete
          kdl-org.kdl
          moonbit.moonbit-lang
          oxc.oxc-vscode
          ryuta46.multi-command
          thang-nm.flow-icons
        ])
        ++ [ tnix ];
    };
}
