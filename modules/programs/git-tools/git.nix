{
  delib,
  host,
  pkgs,
  ...
}:

let
  keys = import ../../../secrets/keys.nix;
  signingKey = builtins.head keys.users.${host.owner};
in

delib.module {
  name = "programs.git-tools.git";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled = {
    programs.git = {
      enable = true;
      signing = {
        format = "ssh";
        key = "~/.ssh/id_ed25519.pub";
        signByDefault = true;
      };
      settings = {
        user = {
          name = "mst-mkt";
          email = "mail@keito.dev";
        };
        gpg.ssh.allowedSignersFile = toString (
          pkgs.writeText "allowed_signers" ''
            mail@keito.dev ${signingKey}
            mst-mkt@hatena.com ${signingKey}
          ''
        );
      };
      includes = [
        {
          condition = "gitdir:~/_/github.com/hatena/";
          contents = {
            user.email = "mst-mkt@hatena.com";
          };
        }
      ];
    };
  };
}
