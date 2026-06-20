{
  delib,
  host,
  inputs,
  ...
}:

delib.module {
  name = "desktop.hazkey";

  options = delib.singleEnableOption host.guiFeatured;

  home.always.imports = [ inputs.nix-hazkey.homeModules.hazkey ];

  home.ifEnabled = {
    services.hazkey.enable = true;

    xdg.configFile."hazkey/config.json".text = builtins.toJSON [
      {
        profileName = "Default";
        autoConvertMode = 3;
        auxTextMode = 3;
        suggestionListMode = 3;
        numSuggestions = 5;
        useRichSuggestion = true;
        numCandidatesPerPage = 9;
        useRichCandidates = true;
        useInputHistory = true;
        specialConversionMode = {
          commaSeparatedNumber = true;
          mailDomain = false;
          calendar = true;
          time = true;
          romanTypography = true;
          unicodeCodepoint = true;
          hazkeyVersion = false;
          halfwidthKatakana = true;
          extendedEmoji = true;
        };
        stopStoreNewHistory = false;
        enabledKeymaps = [
          {
            name = "Japanese Symbol";
            isBuiltIn = true;
            filename = "Japanese Symbol";
          }
        ];
        enabledTables = [
          {
            name = "Romaji";
            isBuiltIn = true;
            filename = "Romaji";
          }
        ];
        submodeEntryPointChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        zenzaiBackendDeviceName = "CPU";
        zenzaiEnable = true;
        zenzaiInferLimit = 8;
        zenzaiContextualMode = true;
        zenzaiProfile = "ソフトウェアエンジニア";
        zenzaiPreference = "外来語はカタカナで書く";
      }
    ];

    i18n.inputMethod.fcitx5.settings.addons.hazkey = {
      globalSection = {
        showTabToSelect = false;
      };
    };
  };
}
