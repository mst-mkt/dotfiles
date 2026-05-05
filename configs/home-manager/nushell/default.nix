{ pkgs, ... }:

{
  imports = [
    ./alias.nix
  ];

  programs.nushell = {
    enable = true;
    plugins = with pkgs.nushellPlugins; [
      gstat
      query
      skim
    ];
  };
}
