# A flake for local kubectl experiments

## Tested on: darwin

## usage

> nix develop

> podman machine init --rootful --disk-size=50 --cpus=4
> podman machine start
> minikube config set rootless false
> minikube config set driver podman
> minikube start