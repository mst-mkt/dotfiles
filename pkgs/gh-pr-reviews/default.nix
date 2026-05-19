{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "gh-pr-reviews";
  version = "0.10.2";

  src = fetchFromGitHub {
    owner = "k1LoW";
    repo = "gh-pr-reviews";
    rev = "v${version}";
    hash = "sha256-XyY+gI9uNYThdyIV0ch+a8pn23oiDYY1ZEqhBlTPgYY=";
  };

  vendorHash = "sha256-wy8hscTE4BB3Uu1x5o2sMediyDEPrU6zegfB6B/fbXA=";

  ldflags = [
    "-s"
    "-w"
    "-X github.com/k1LoW/gh-pr-reviews/version.Version=v${version}"
  ];

  meta = {
    description = "gh CLI extension to identify unresolved review comments in a pull request";
    homepage = "https://github.com/k1LoW/gh-pr-reviews";
    license = lib.licenses.mit;
    mainProgram = "gh-pr-reviews";
  };
}
