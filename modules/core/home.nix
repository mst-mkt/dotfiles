{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "core.home";

  options = delib.singleEnableOption true;

  home.ifEnabled = {
    home.username = host.owner;
    home.homeDirectory =
      if pkgs.stdenv.hostPlatform.isDarwin then "/Users/${host.owner}" else "/home/${host.owner}";

    programs.home-manager.enable = true;
  };
}
