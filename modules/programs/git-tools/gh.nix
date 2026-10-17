{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "programs.git-tools.gh";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.ifEnabled = {
    programs.gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
      };
      extensions = [
        pkgs.gh-markdown-preview
        pkgs.gh-poi
        pkgs.gh-stack
      ];
    };
  };
}
