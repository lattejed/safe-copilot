default:
  just --list

docker-setup-persistence:
  #!/bin/bash
  docker volume create safe-copilot-persistence
  docker run --rm \
    -v safe-copilot-persistence:/data \
    -v ./config.json:/config.json:ro \
    alpine:latest \
    sh -c "cp /config.json /data/config.json && chmod 644 /data/config.json"

docker-remove-persistence:
  docker volume rm safe-copilot-persistence

docker-shell-persistence:
  docker run --rm -it -v safe-copilot-persistence:/data alpine sh

docker-build:
  docker build --tag safe-copilot .

[no-cd]
docker-run:
  #!/bin/bash
  export $(cat $HOME/Developer/lattejed/safe-copilot/.env | xargs)
  docker run -it --rm \
    -v safe-copilot-persistence:/copilot-home \
    -v "$(pwd)":/workspace:ro \
    -e COPILOT_HOME=/copilot-home \
    -e COPILOT_GITHUB_TOKEN=${COPILOT_GITHUB_TOKEN} \
    safe-copilot:latest
