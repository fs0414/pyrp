{
  description = "Math & ML learning environment with Python";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      # macOS Apple Silicon: "aarch64-darwin"
      # macOS Intel: "x86_64-darwin"
      # Linux: "x86_64-linux"
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          python314
          uv
          # Jupyter
        ];

        shellHook = ''
          if [ -n "$BASH_VERSION" ]; then
            export PS1="(nix:pyrp) \[\033[1;34m\]\W\[\033[0m\] $ "
          elif [ -n "$ZSH_VERSION" ]; then
            export PROMPT="(nix:pyrp) %F{blue}%1~%f $ "
          else
            export PS1="(nix:pyrp) \W $ "
          fi

          if [[ $- == *i* ]]; then
            echo "Python: $(python3 --version)"
            echo "uv: $(uv --version)"
            echo ""
            echo "init: uv sync"
            echo "Jupyter exec:     uv run jupyter lab"
          fi
        '';

        # uv use Nix Python
        env = {
          UV_PYTHON_PREFERENCE = "system";
        };
      };
    };
}
