{ ... }:

{
  programs.git = {
    enable = true;
    settings.user = {
      name = "mst-mkt";
      email = "mail@keito.dev";
    };
  };
}
