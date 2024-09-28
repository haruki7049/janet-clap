{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      imports = [
        inputs.treefmt-nix.flakeModule
      ];
      perSystem =
        { pkgs, system, ... }:
        {
          treefmt = {
            projectRootFile = "flake.nix";
            programs.nixfmt.enable = true;
            programs.shellcheck.enable = true;
            programs.actionlint.enable = true;

            settings.formatter.shellcheck.excludes = [
              ".envrc"
            ];
          };

          devShells.default = pkgs.mkShell {
            packages = [
              # Nix
              pkgs.nil

              # Janet
              pkgs.janet
              pkgs.jpm
            ];
          };
        };
    };
}
