{
  delib,
  homeConfig,
  host,
  pkgs,
  ...
}:

let
  # PATCH: replace emoji icons with NF glyphs
  nix-output-monitor = pkgs.nix-output-monitor.overrideAttrs (old: {
    postPatch = (old.postPatch or "") + ''
      substituteInPlace lib/NOM/Print.hs \
        --replace-fail 'clock = "⏱"' 'clock = "\xF017"' \
        --replace-fail 'running = "⏵"' 'running = "\xF04B"' \
        --replace-fail 'done = "✔"' 'done = "\xF00C"' \
        --replace-fail 'todo = "⏸"' 'todo = "\xF04C"'
    '';
  });
in

delib.module {
  name = "programs.nix-tools.nh";

  options = delib.singleEnableOption (host.cliFeatured && !host.isMobile);

  home.ifEnabled.programs.nh = {
    enable = true;
    package = pkgs.nh.override { inherit nix-output-monitor; };
    flake = "${homeConfig.home.homeDirectory}/dotfiles";
  };
}
