{ delib, ... }:

delib.module {
  name = "core.nixbuild";

  options = delib.singleEnableOption true;

  nixos.ifEnabled = {
    age.secrets.nixbuild-ssh-key.file = ../../secrets/nixbuild-ssh-key.age;

    programs.ssh.extraConfig = ''
      Host eu.nixbuild.net
        PubkeyAcceptedKeyTypes ssh-ed25519
        ServerAliveInterval 60
    '';

    nix = {
      distributedBuilds = true;
      buildMachines = [
        {
          hostName = "eu.nixbuild.net";
          system = "x86_64-linux";
          sshKey = "/run/agenix/nixbuild-ssh-key";
          publicHostKey = "c3NoLWVkMjU1MTkgQUFBQUMzTnphQzFsWkRJMU5URTVBQUFBSVBJUUNaYzU0cG9KOHZxYXdkOFRyYU5yeVFlSm52SDFlTHBJRGdiaXF5bU0=";
          maxJobs = 100;
          supportedFeatures = [
            "benchmark"
            "big-parallel"
          ];
        }
      ];
      settings.builders-use-substitutes = true;
    };
  };
}
