# safe-copilot

This repository contains a Dockerized version of the GitHub Copilot CLI, designed to run in a secure and isolated environment. The Docker image includes the necessary dependencies and configurations to ensure that the Copilot CLI operates safely, without exposing sensitive data or system resources.

Add the following to `~/.zshrc`:

```bash
copilot () {
  export $(cat $HOME/Developer/<user>/safe-copilot/.env | xargs) # should contain COPILOT_GITHUB_TOKEN
  docker run -it --rm \
    -e COPILOT_GITHUB_TOKEN=${COPILOT_GITHUB_TOKEN} \
    -e COPILOT_HOME=/root/.copilot \
    -v "$(pwd)":/workspace:ro \
    safe-copilot:latest
}
```
