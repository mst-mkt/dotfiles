{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "gh-pr-reviews";
  version = "0.11.0";

  src = fetchFromGitHub {
    owner = "k1LoW";
    repo = "gh-pr-reviews";
    rev = "v${version}";
    hash = "sha256-Ue3aDhg8QsPTTCzv2V7uq4td6LkwZwbffoFEF0y5K5I=";
  };

  vendorHash = "sha256-8NHglMb6RTjt5hgtAW+wr9OOLwbLn3kjF2vnKbVyjEY=";

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
