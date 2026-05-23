{
  description = "CV built with LaTeX";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f {
        pkgs = nixpkgs.legacyPackages.${system};
      });

      texlive = pkgs: pkgs.texlive.combine {
        inherit (pkgs.texlive)
          scheme-small
          latexmk
          cm-super
          moderncv
          fontawesome5
          datetime
          fmtcount
          multirow
          arydshln
          ;
      };
    in
    {
      devShells = forAllSystems ({ pkgs }: {
        default = pkgs.mkShell {
          packages = [
            (texlive pkgs)
          ];
        };
      });

      packages = forAllSystems ({ pkgs }: {
        default = pkgs.stdenvNoCC.mkDerivation {
          pname = "cv";
          version = "0.1.0";
          src = ./.;

          nativeBuildInputs = [ (texlive pkgs) ];

          buildPhase = ''
            latexmk -pdf -interaction=nonstopmode main.tex
          '';

          installPhase = ''
            mkdir -p $out
            cp main.pdf $out/
          '';
        };
      });
    };
}
