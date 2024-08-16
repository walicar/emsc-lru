{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }: utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
      emscPath = pkgs.emscripten;
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          clang-tools
          nodejs_22
          emscripten
        ];
        shellHook = ''
          export SRC=$(pwd)
          export EMSC_DEV=${emscPath}/share/emscripten/system
          bash scripts/setup_clangd.sh
          bash scripts/setup_vscode.sh
        '';
      };
    }
  );
}