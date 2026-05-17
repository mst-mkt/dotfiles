{ delib, host, ... }:

delib.module {
  name = "programs.cli-utilities";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled = {
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
  };
}
