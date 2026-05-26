{
  delib,
  host,
  inputs,
  ...
}:

delib.module {
  name = "programs.cbhook";

  options = delib.singleEnableOption host.guiFeatured;

  home.always.imports = [ inputs.cbhook.homeManagerModules.default ];

  home.ifEnabled = {
    programs.cbhook = {
      enable = true;
      hooks = [
        {
          name = "remove query params (x.com)";
          action.replace = {
            pattern = "(https?://x\\.com/[^\\s?#]*)\\?[^\\s#]*";
            replacement = "\${1}";
          };
        }
        {
          name = "x.com -> twitter.com";
          action.replace = {
            pattern = "(https?://)x\\.com([/:?#])";
            replacement = "\${1}twitter.com\${2}";
          };
        }
        {
          name = "remove utm_* params followed by another param";
          action.replace = {
            pattern = "utm_[^=&#\\s]*=[^&#\\s]*&";
            replacement = "";
          };
        }
        {
          name = "remove trailing utm_* param";
          action.replace = {
            pattern = "[?&]utm_[^=&#\\s]*=[^&#\\s]*";
            replacement = "";
          };
        }
      ];
    };
  };
}
