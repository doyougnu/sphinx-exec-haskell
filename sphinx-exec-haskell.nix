{ pkgs }:

with pkgs;

let sphinx-exec-haskell = python3.pkgs.buildPythonPackage {
      pname   = "sphinx-exec-haskell";
      version = "0.10.0";
      format  = "pyproject";

      src = ./.;

      doCheck = false;

      nativeBuildInputs     = with python3.pkgs; [ setuptools ];
      propagatedBuildInputs = with python3.pkgs; [ docutils ];

      meta = with lib; {
        homepage    = "https://github.com/input-output-hk/hs-opt-handbook.github.io";
        description = "A sphinx extension to execute and test haskell code blocks";
        license     = licenses.bsd3;
        maintainers = with maintainers; [ doyougnu ];
      };
    };



in
mkShell { packages = [ sphinx-exec-haskell ]; }
