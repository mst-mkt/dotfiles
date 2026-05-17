{
  imports = [
    ./extensions.nix
  ];

  programs.floorp = {
    enable = true;
    profiles.default = {
      isDefault = true;
      settings = {
        "extensions.autoDisableScopes" = 0;
        "extensions.enabledScopes" = 15;
      };
    };
  };
}
