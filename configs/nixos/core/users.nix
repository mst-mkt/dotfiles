{ pkgs, username, ... }:

{
  environment.shells = [ pkgs.nushell ];

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
    ];
    shell = pkgs.nushell;
  };
}
