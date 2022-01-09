{ lib
, llvmPackages_11
, cmake
}:

llvmPackages_11.stdenv.mkDerivation rec {
  pname = "main";
  version = "0.1.0";
  src = ./.;

  nativeBuildInputs = [ cmake ];

  cmakeFlags = [
    "-DENABLE_INSTALL=ON"
  ];

  meta = with lib; {
    description = "A nix derivation for intro cpp projects";
    platforms = with platforms; linux ++ darwin;
  };
}