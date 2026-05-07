{ config, inputs, ... }:

{
  imports = [ inputs.nix-index-database.homeModules.nix-index ];

  programs.nix-index.enable = true;
  programs.nix-index-database.comma.enable = true;

  programs.bat.enable = true;

  programs.eza = {
    enable = true;
    enableNushellIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };

  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
    ignoreCase = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableNushellIntegration = true;
  };

  programs.nh = {
    enable = true;
    osFlake = "${config.home.homeDirectory}/dotfiles";
  };
}
