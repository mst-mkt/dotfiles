{ pkgs, ... }:

{
  programs.command-not-found.enable = false;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  environment.systemPackages = with pkgs; [
    wget
    curl
  ];
}
