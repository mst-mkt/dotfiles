{ pkgs, ... }:

{
  imports = [
    ./alias.nix
  ];

  programs.nushell = {
    enable = true;

    settings = {
      show_banner = false;

      table.mode = "markdown";
      float_precision = 4;
      datetime_format = {
        normal = "%Y-%m-%d %H:%M:%S";
        table = "%Y-%m-%d %H:%M";
      };

      history = {
        file_format = "sqlite";
        max_size = 1000000;
        isolation = true;
      };

      completions = {
        algorithm = "fuzzy";
        case_sensitive = false;
      };

      rm.always_trash = true;
      highlight_resolved_externals = true;
      use_kitty_protocol = true;
    };

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
