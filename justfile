default:
  just --list

docker-setup-persistence:
  #!/bin/bash
  docker volume create safe-copilot-persistence
  docker run --rm \
    -v safe-copilot-persistence:/data \
    -v ./settings.json:/settings.json:ro \
    alpine:latest \
    sh -c "cp /settings.json /data/settings.json && chmod 644 /data/settings.json"

docker-remove-persistence:
  docker volume rm safe-copilot-persistence

docker-shell-persistence:
  docker run --rm -it -v safe-copilot-persistence:/data alpine sh

docker-build:
  docker build --tag safe-copilot .
