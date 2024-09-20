{
  pkgs ? import <nixpkgs> { },
  buildJanetPackage-source ? builtins.fetchTarball {
    url = "https://github.com/haruki7049/buildJanetPackage/archive/9bfdf0ba39651a146ccb022bcadd81ff60499209.tar.gz";
    sha256 = "1rnjh86sacqrzzx68ah408g5wdma3vfh4y104g8ksgqpdmqnq6y2";
  },
}:

let
  janetBuilder = import buildJanetPackage-source { inherit pkgs; };
  lib = pkgs.lib;
in
janetBuilder.buildJanetLib {
  pname = "janet-clap";
  version = "0.1.0";
  src = lib.cleanSource ./.;
  depsFile = ./deps.nix;
}
