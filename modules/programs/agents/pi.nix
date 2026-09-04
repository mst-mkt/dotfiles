{
  delib,
  host,
  pkgs,
  inputs,
  ...
}:

let
  llm-agents = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system};
in

delib.module {
  name = "programs.agents.pi";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured && host.isPersonal);

  home.always.imports = [ inputs.pi.homeManagerModules.default ];

  home.ifEnabled.programs.pi.coding-agent = {
    enable = true;
    package = llm-agents.pi;

    settings = {
      defaultProvider = "opencode-go";
      defaultThinkingLevel = "high";

      tuiMode = "fullscreen";
      editorPaddingX = 1;
      outputPad = 1;
      showHardwareCursor = true;

      enableInstallTelemetry = false;
    };

    environment.PI_SKIP_VERSION_CHECK.value = "1";
  };
}
