ARG REGISTRY_PREFIX='wagoautomation/'
ARG SDK_BUILDER_VERSION='3.0.1'

FROM ${REGISTRY_PREFIX}sdk-builder:${SDK_BUILDER_VERSION} as wp400-firmware-sdk


ARG USERID
RUN useradd -l -u "$USERID" -ms /bin/bash user
RUN chown -R user:user /home/user 
COPY --chown=user:user build.sh /usr/local/bin/build
COPY --chown=user:user certs/* /usr/local/share/ca-certificates/
RUN update-ca-certificates
RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    libx11-dev \ 
    python-libxml2 \ 
    python3-mako \
    gcc-multilib \
    g++-multilib \   
    python3-dev \ 
    libmpc-dev \
    libgmp3-dev \
    python3-setuptools \ 
    libxml-parser-perl
