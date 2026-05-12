{
  imports = [
    ./extensions.nix
    ./settings.nix
  ];

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
  };
}
