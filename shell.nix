{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    gnumake
    texlive.combined.scheme-full
    imagemagick
    pandoc
  ];
}
