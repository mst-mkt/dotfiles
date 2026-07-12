{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchurl,
  makeWrapper,
}:

let
  version = "0.1.10";
  binaries = {
    x86_64-linux = {
      url = "https://github.com/yusukebe/ax/releases/download/v${version}/ax-linux-x64";
      hash = "sha256-dJWaZpyB58SmXv6SRMxyM8d1LSNSnM7wBHkFbjM04NA=";
    };
    aarch64-linux = {
      url = "https://github.com/yusukebe/ax/releases/download/v${version}/ax-linux-arm64";
      hash = "sha256-jPkyzBYwN3Lf4p3bHDyp8LpEOw9AMV14xVuKefs8BF0=";
    };
    x86_64-darwin = {
      url = "https://github.com/yusukebe/ax/releases/download/v${version}/ax-darwin-x64";
      hash = "sha256-heNmppU/1vLe+cetq3NsyKmqizS3GE4TawTRbyX1qv8=";
    };
    aarch64-darwin = {
      url = "https://github.com/yusukebe/ax/releases/download/v${version}/ax-darwin-arm64";
      hash = "sha256-FCCrnigkNiCtCHsuzpskyZaxfJGGUdltOMu2A+WKvOk=";
    };
  };
  binary = fetchurl (
    binaries.${stdenv.hostPlatform.system}
      or (throw "yusukebe/ax: unsupported system ${stdenv.hostPlatform.system}")
  );
in
stdenv.mkDerivation {
  pname = "ax";
  inherit version;

  src = fetchFromGitHub {
    owner = "yusukebe";
    repo = "ax";
    rev = "v${version}";
    hash = "sha256-UkkuNAM8iPd0dDsgUchKi8mZLEqlG3HkMQ33QMl5PtQ=";
  };

  nativeBuildInputs = [ makeWrapper ];

  dontUnpack = true;
  dontStrip = true;

  installPhase =
    if stdenv.hostPlatform.isLinux then
      ''
        runHook preInstall
        install -Dm755 ${binary} $out/libexec/ax
        makeWrapper ${stdenv.cc.bintools.dynamicLinker} $out/bin/ax \
          --add-flags $out/libexec/ax
        runHook postInstall
      ''
    else
      ''
        runHook preInstall
        install -Dm755 ${binary} $out/bin/ax
        runHook postInstall
      '';

  meta = {
    description = "The AI-era curl";
    homepage = "https://github.com/yusukebe/ax";
    license = lib.licenses.mit;
    mainProgram = "ax";
    platforms = lib.attrNames binaries;
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
  };
}
