default:
  just --list

docker-build:
  docker build --tag safe-copilot .

docker-run:
  #!/bin/bash
  export $(cat .env | xargs)
  docker run -it --rm \
    -e COPILOT_GITHUB_TOKEN=${COPILOT_GITHUB_TOKEN} \
    -e COPILOT_HOME=/root/.copilot \
    -v "$(pwd)":/workspace:ro \
    safe-copilot:latest
