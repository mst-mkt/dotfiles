{
  lib,
  rustPlatform,
  fetchFromGitHub,
  git,
}:

rustPlatform.buildRustPackage rec {
  pname = "git-hunk";
  version = "0.1.3";

  src = fetchFromGitHub {
    owner = "nexxeln";
    repo = "git-hunk";
    rev = "v${version}";
    hash = "sha256-VMEoqwn1oW9ehbBawCsy8B/r7Bfm9rKGUMPB8hynNvo=";
  };

  cargoLock.lockFile = "${src}/Cargo.lock";

  nativeCheckInputs = [ git ];

  meta = {
    description = "Non-interactive hunk staging for AI agents";
    homepage = "https://github.com/nexxeln/git-hunk";
    license = lib.licenses.asl20;
    mainProgram = "git-hunk";
  };
}
