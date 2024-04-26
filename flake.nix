{
  inputs = {
    nixpkgs.url =
      "https://github.com/NixOS/nixpkgs/archive/refs/tags/23.11.tar.gz";
  };
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.${system}.default = derivation {
        inherit system;
        name = "simple";
        src = ./.;
        builder = with pkgs; "${bash}/bin/bash";
        args = [ "-c" "echo foo > $out" ];
      };
    };
}

