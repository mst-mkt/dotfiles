{
  delib,
  host,
  inputs,
  pkgs,
  ...
}:

let
  packages = inputs.moocs-collect-nix.packages.${pkgs.stdenv.hostPlatform.system};
in

delib.module {
  name = "programs.moocs-collect";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled =
    { myconfig, ... }:
    let
      downloadPath = "/home/${myconfig.constants.username}/Documents/moocs-collect";

      collect-cli = pkgs.symlinkJoin {
        inherit (packages.collect-cli) pname version meta;
        paths = [ packages.collect-cli ];
        nativeBuildInputs = [ pkgs.makeBinaryWrapper ];
        postBuild = ''
          wrapProgram $out/bin/collect-cli \
            --add-flags "--path" \
            --add-flags "${downloadPath}"
        '';
      };
    in
    {
      home.packages = [
        collect-cli
        packages.collect-tui
        packages.mcmerge
      ];

      # collect-tui settings
      xdg.configFile."moocs-collect/settings.json".text = builtins.toJSON {
        download_path = downloadPath;
      };
    };
}
