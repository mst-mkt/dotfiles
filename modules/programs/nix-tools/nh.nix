{
  delib,
  homeConfig,
  host,
  ...
}:

delib.module {
  name = "programs.nix-tools.nh";

  options = delib.singleEnableOption (host.cliFeatured && !host.isMobile);

  home.ifEnabled = {
    programs.nh = {
      enable = true;
      flake = "${homeConfig.home.homeDirectory}/dotfiles";
    };
  };
}
