{ delib, ... }:

delib.overlayModule {
  name = "local";
  overlay =
    final: _prev:
    let
      pkgsDir = ../../pkgs;
      entries = builtins.readDir pkgsDir;
      names = builtins.filter (n: entries.${n} == "directory") (builtins.attrNames entries);
    in
    builtins.listToAttrs (
      map (name: {
        inherit name;
        value = final.callPackage (pkgsDir + "/${name}") { };
      }) names
    );
  targets = [
    "nixos"
    "darwin"
  ];
  enabled = true;
}
