{
  description = "mdsplit flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    pyproject-nix.url = "github:nix-community/pyproject.nix";
    pyproject-nix.inputs.nixpkgs.follows = "nixpkgs";

    mdsplitsrc = {
      url = "github:markusstraub/mdsplit";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, mdsplitsrc, pyproject-nix }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

        mdsplitProject = pyproject-nix.lib.project.loadPoetryPyproject {
          projectRoot = mdsplitsrc;
        };
        mdsplit = pkgs.python3.pkgs.buildPythonPackage (mdsplitProject.renderers.buildPythonPackage {
          project = "mdsplit";
          python = pkgs.python3;
        });
      in
        {
          apps.default = {
            type = "app";
            program = mdsplit + "/bin/mdsplit";
          };
        });
}
