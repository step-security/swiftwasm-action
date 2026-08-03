FROM ghcr.io/swiftwasm/carton:0.20.1@sha256:8a966aeeaad18b5d45605964a8fc54675b8465d9328ea6d7f10e0ab43a498483

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && apt-get -q update && \
  apt-get -q install -y \
  curl \
  jq \
  wabt && \
  rm -r /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
