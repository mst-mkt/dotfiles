{ delib, host, ... }:

delib.module {
  name = "programs.nix-tools.nh";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled =
    { myconfig, ... }:
    {
      programs.nh = {
        enable = true;
        osFlake = "/home/${myconfig.constants.username}/dotfiles";
      };
    };
}
