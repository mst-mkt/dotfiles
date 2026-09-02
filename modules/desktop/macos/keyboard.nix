{ delib, host, ... }:

let
  user = host.owner;
  plistBuddy = cmd:
    ''launchctl asuser "$(id -u -- ${user})" sudo --user=${user} -- /usr/libexec/PlistBuddy -c "${cmd}" /Users/${user}/Library/Preferences/com.apple.symbolichotkeys.plist'';
in

delib.module {
  name = "desktop.keyboard";

  options = delib.singleEnableOption host.guiFeatured;

  darwin.ifEnabled = {
    system.defaults.NSGlobalDomain = {
      # prefer F1-F12 over media keys
      "com.apple.keyboard.fnState" = true;
    };

    system.activationScripts.postActivation.text = ''
      # disable ctrl+space (input source switch)
      ${plistBuddy "Set :AppleSymbolicHotKeys:60:enabled false"}
      # disable cmd+space (spotlight)
      ${plistBuddy "Set :AppleSymbolicHotKeys:64:enabled false"}
    '';
  };
}
