# safe-copilot

This repository contains a Dockerized version of the GitHub Copilot CLI, designed to run in a secure and isolated environment. The Docker image includes the necessary dependencies and configurations to ensure that the Copilot CLI operates safely, without exposing sensitive data or system resources.

Run `just docker-build` to build the Docker image.

Add the following to `~/.zshrc`:

```bash
alias copilot="just $HOME/<dir>/safe-copilot/docker-run"
```
