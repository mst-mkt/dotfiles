{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "programs.gh";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled.programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
    extensions = [
      pkgs.gh-markdown-preview
      pkgs.gh-poi
      pkgs.gh-pr-reviews
    ];
  };
}
