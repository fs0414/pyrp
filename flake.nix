{
  description = "Math & ML learning environment with Python";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    shared-flake.url = "github:sorafujitani/shared-flake-nix";
  };

  outputs = { self, nixpkgs, shared-flake }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = shared-flake.lib.mkDevShell {
        inherit pkgs;
        name = "pyrp";

        buildInputs = with pkgs; [
          python314
          uv
        ];

        shellHook = ''
          if [[ $- == *i* ]]; then
            echo "Python: $(python3 --version)"
            echo "uv: $(uv --version)"
            echo ""
            echo "init: uv sync"
            echo "Jupyter exec:     uv run jupyter lab"
          fi
        '';

        env = {
          UV_PYTHON_PREFERENCE = "system";
        };
      };
    };
}
