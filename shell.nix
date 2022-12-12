{ nixpkgs ? import <nixpkgs> {} } :

let
  inherit (nixpkgs) pkgs;
  ocamlPackages = pkgs.ocamlPackages;
  #ocamlPackages = pkgs.ocamlPackages_latest;
  dune = pkgs.dune_3;

in
pkgs.stdenv.mkDerivation {
  name = "my-ocaml-env";
  buildInputs = [
    ### basic
    ocamlPackages.findlib # essential
    ocamlPackages.ocaml
    ocamlPackages.utop
    ocamlPackages.ocaml-lsp
    dune

    ### tools
    pkgs.rlwrap
    pkgs.vscode
  ];
}
