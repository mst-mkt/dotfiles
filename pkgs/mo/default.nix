{
  lib,
  stdenvNoCC,
  fetchurl,
}:

let
  version = "1.5.6";
  sources = {
    x86_64-linux = {
      url = "https://github.com/k1LoW/mo/releases/download/v${version}/mo_v${version}_linux_amd64.tar.gz";
      hash = "sha256-MZXfzWc1+rrekBphU/Ic+mGROVXxxQVk/fWcY1DLwtM=";
    };
    aarch64-linux = {
      url = "https://github.com/k1LoW/mo/releases/download/v${version}/mo_v${version}_linux_arm64.tar.gz";
      hash = "sha256-YQYDzRiMq/WsxRSFCDnrC1jzVtuO7auK8afU0Adn+Ww=";
    };
  };
  source =
    sources.${stdenvNoCC.hostPlatform.system}
      or (throw "k1LoW/mo: unsupported system ${stdenvNoCC.hostPlatform.system}");
in
stdenvNoCC.mkDerivation {
  pname = "mo";
  inherit version;

  src = fetchurl source;

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    install -Dm755 mo $out/bin/mo
    runHook postInstall
  '';

  meta = {
    description = "Markdown viewer that opens .md files in a browser";
    homepage = "https://github.com/k1LoW/mo";
    license = lib.licenses.mit;
    mainProgram = "mo";
    platforms = lib.attrNames sources;
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
  };
}
