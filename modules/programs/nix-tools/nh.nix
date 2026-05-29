{
  delib,
  host,
  constants,
  ...
}:

delib.module {
  name = "programs.nix-tools.nh";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled.programs.nh = {
    enable = true;
    osFlake = "/home/${constants.username}/dotfiles";
  };
}
