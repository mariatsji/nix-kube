{
  inputs = {
    nixpkgs.url =
      "https://github.com/NixOS/nixpkgs/archive/refs/tags/23.11.tar.gz";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        system = "x86_64-darwin";
        pkgs = nixpkgs.legacyPackages.${system};
      in with pkgs; {
        devShells.default = mkShell {
          buildInputs = [ minikube podman qemu coreutils openssh ];
          KUBECONFIG=".kube";
          shellHook=''
            alias docker=podman
          '';
        };
      }
    );
}

