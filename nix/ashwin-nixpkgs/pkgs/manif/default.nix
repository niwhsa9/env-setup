{ lib
, stdenv
, cmake
, eigen
}:

stdenv.mkDerivation rec {
  pname = "manif";
  version = "1.0.0";

  src = builtins.fetchGit {
    url = https://github.com/artivis/manif.git;
    rev = "64f6e0c7528c62f9e3027ebcee86bf871aacc796";
  };

  nativeBuildInputs = [ cmake eigen ];

  meta = with lib; {
    homepage = "https://artivis.github.io/manif/";
    description = "A small C++11 header-only library for Lie theory.";
    license = licenses.lgpl3Plus;
    platforms = platforms.unix;
  };
}