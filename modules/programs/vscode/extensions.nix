{
  delib,
  pkgs,
  lib,
  host,
  inputs,
  ...
}:

let
  extensions = inputs.nix-vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system};
in

delib.module {
  name = "programs.vscode";

  home.ifEnabled = {
    programs.vscode.profiles.default.extensions =
      (with pkgs.vscode-extensions; [
        antfu.slidev
        charliermarsh.ruff
        github.copilot-chat
        github.vscode-github-actions
        golang.go
        graphql.vscode-graphql-syntax
        ibm.output-colorizer
        jnoortheen.nix-ide
        mkhl.direnv
        ms-python.python
        ms-toolsai.jupyter
        nefrob.vscode-just-syntax
        oxc.oxc-vscode
        rust-lang.rust-analyzer
        streetsidesoftware.code-spell-checker
        stylelint.vscode-stylelint
        sumneko.lua
        tamasfe.even-better-toml
        thenuprojectcontributors.vscode-nushell-lang
        usernamehw.errorlens
        vitest.explorer
        yoavbls.pretty-ts-errors
      ])
      ++ (with extensions.vscode-marketplace-release-universal; [
        antfu.array-index-inlay
        antfu.unocss
        ionutvmi.path-autocomplete
        kdl-org.kdl
        mizdra.css-modules-kit-vscode
        moonbit.moonbit-lang
        ryuta46.multi-command
        thang-nm.flow-icons
        typespec.typespec-vscode
        ubugeeei.vize
      ])
      ++ lib.optionals (host.name == "greenpath") [
        pkgs.vscode-extensions.dbaeumer.vscode-eslint
        pkgs.vscode-extensions.esbenp.prettier-vscode
        pkgs.vscode-extensions.hashicorp.terraform
        extensions.vscode-marketplace-release-universal.jkillian.custom-local-formatters
        extensions.vscode-marketplace-release-universal.kfly8.test2-subtest-filter
        extensions.vscode-marketplace-release-universal.orta.vscode-jest
        extensions.vscode-marketplace-release-universal.richterger.perl
        extensions.vscode-marketplace-release-universal.samosad.tt
      ];
  };
}
