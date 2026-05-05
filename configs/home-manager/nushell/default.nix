{ pkgs, ... }:

{
  imports = [
    ./alias.nix
  ];

  programs.nushell = {
    enable = true;

    extraConfig = builtins.concatStringsSep "\n\n" (
      map builtins.readFile [
        ./autopair.nu
      ]
    );

    plugins = with pkgs.nushellPlugins; [
      gstat
      query
      skim
    ];
  };
}
