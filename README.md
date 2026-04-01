# safe-copilot

This repository contains a Dockerized version of the GitHub Copilot CLI, designed to run in a secure and isolated environment. The Docker image includes the necessary dependencies and configurations to ensure that the Copilot CLI operates safely, without exposing sensitive data or system resources.

Run `just docker-setup-persistence` and `just docker-build` to set up the persistence volume and build the Docker image.

This should be added to your project's `justfile` and run from the root of your project:

```justfile
copilot:
  #!/bin/bash
  export $(cat .env.copilot | xargs)
  docker run -it --rm \
    -v safe-copilot-persistence:/copilot-home \
    -v "$(pwd)":/workspace:ro \
    -v /dev/null:/workspace/.secrets \
    -v /workspace/secretdir \
    -e COPILOT_HOME=/copilot-home \
    -e COPILOT_GITHUB_TOKEN=${COPILOT_GITHUB_TOKEN} \
    safe-copilot:latest
```

Use `-v /dev/null:/workspace/.secrets` and `-v /workspace/secretdir` to prevent the container from accessing sensitive files on your host machine. These **MUST** come after the read-only mount of your project directory to take precedence.
