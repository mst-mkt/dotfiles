{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "programs.steam";

  options = delib.singleEnableOption (host.guiFeatured && host.gamingFeatured);

  nixos.ifEnabled = {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extraCompatPackages = with pkgs; [ proton-ge-bin ];
      protontricks.enable = true;
    };

    programs.gamemode.enable = true;
  };
}
