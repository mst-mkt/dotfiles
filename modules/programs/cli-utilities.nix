{
  delib,
  host,
  lib,
  pkgs,
  inputs,
  ...
}:

let
  nur-packages = inputs.nur-packages.packages.${pkgs.stdenv.hostPlatform.system};
  serenity-emoji = inputs.serenity-emoji.packages.${pkgs.stdenv.hostPlatform.system};
in

delib.module {
  name = "programs.cli-utilities";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled = {
    home.packages = [
      pkgs.bottom
      pkgs.ffmpeg
      pkgs.fzf
      pkgs.jnv
      pkgs.jq
      pkgs.mmv-go
      pkgs.tree
      pkgs.wget
      serenity-emoji.cli
    ]
    ++ lib.optionals host.iniadFeatured [ nur-packages.esa-cli ]
    ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux [ pkgs.wl-clipboard ];

    programs.bat.enable = true;

    programs.eza = {
      enable = true;
      enableNushellIntegration = true;
    };

    programs.zoxide = {
      enable = true;
      enableNushellIntegration = true;
    };

    programs.carapace = {
      enable = true;
      enableNushellIntegration = true;
      ignoreCase = true;
    };
  };
}
