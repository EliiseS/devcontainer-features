# Dev Container Features by EliiseS

![Devcontainers](https://img.shields.io/static/v1?style=for-the-badge&message=Devcontainers&color=2496ED&logo=Docker&logoColor=FFFFFF&label=)
![Codespaces](https://img.shields.io/static/v1?style=for-the-badge&message=Codespaces&color=181717&logo=GitHub&logoColor=FFFFFF&label=)

This repo contains custom [dev container Features](https://containers.dev/implementors/features/) for [VSCode dev containers](https://code.visualstudio.com/docs/devcontainers/containers) and
[GitHub Codespaces](https://github.com/features/codespaces) created by EliiseS, hosted on GitHub Container Registry. This repository follows the [dev container Feature distribution specification](https://containers.dev/implementors/features-distribution/).

To provide feedback or report issues, please create an issue [on this repo](https://github.com/EliiseS/devcontainer-features/issues).

## Usage

This repository contains a _collection_ of features. [View the full list of features](src/). Each folder contains a `readme.md` with a description and usage of the feature.


⚠️ Officially only  support [debian](https://hub.docker.com/_/debian) and [ubuntu](https://hub.docker.com/_/ubuntu) based images as of now.

### Example

Example `devcontainer.json` with the usage of the `bash-profile` feature:

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/EliiseS/devcontainer-features/bash-profile:1": {
            "command": "alias e=echo"
        }
    }
}
```

```bash
$ e "Hello world"

Hello world
```

## Contributing

For contributing, see the [CONTRIBUTING.MD](CONTRIBUTING.MD).
