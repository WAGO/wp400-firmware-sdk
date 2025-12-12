
ARG REGISTRY_PREFIX='wagoautomation/'
ARG SDK_BUILDER_VERSION='4.0.0'

ARG GCC_VERSION=12.3.0
ARG PREFIX=/opt/gcc

FROM ${REGISTRY_PREFIX}sdk-builder:${SDK_BUILDER_VERSION} AS tp-firmware-sdk

# Re-declare args inside the stage
ARG GCC_VERSION
ARG PREFIX
ARG USERID

# User setup
RUN useradd -l -u "${USERID}" -ms /bin/bash user && \
    chown -R user:user /home/user

# Tools & certs
COPY build.sh /usr/local/bin/build
COPY certs/* /usr/local/share/ca-certificates

# Install build deps BEFORE compiling GCC
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        wget ca-certificates xz-utils \
        build-essential flex bison \
        libgmp-dev libmpfr-dev libmpc-dev zlib1g-dev \
        python3 python3-dev python3-mako python3-yaml python3-setuptools python3-libxml2 \
        libx11-dev libxml2-dev \
        libxml-parser-perl \
        pkg-config file git; \
    update-ca-certificates; \
    rm -rf /var/lib/apt/lists/*

# Download GCC Tarball (Mirror-Fallback)
RUN set -eux; \
    cd /tmp; \
    # Wenn die CA-Kette im Container korrekt ist, brauchst du --cacert nicht
    curl -fsSL -o "gcc-${GCC_VERSION}.tar.xz" \
      "https://mirrors.kernel.org/gnu/gcc/gcc-${GCC_VERSION}/gcc-${GCC_VERSION}.tar.xz" \
    || curl -fsSL -o "gcc-${GCC_VERSION}.tar.xz" \
      "https://ftp.gnu.org/gnu/gcc/gcc-${GCC_VERSION}/gcc-${GCC_VERSION}.tar.xz"; \
    tar -xf "gcc-${GCC_VERSION}.tar.xz"

# Configure, Build, Install
RUN set -eux; \
    mkdir -p /tmp/gcc-build; \
    cd /tmp/gcc-build; \
    "../gcc-${GCC_VERSION}/configure" \
        --prefix="${PREFIX}" \
        --enable-languages=c,c++ \
        --disable-multilib \
        --disable-bootstrap \
        --enable-checking=release; \
    make -j"$(nproc)"; \
    make install; \
    # Sanity-Check
    ls -l "${PREFIX}/bin"; \
    test -x "${PREFIX}/bin/gcc" && test -x "${PREFIX}/bin/g++"; \
    # Cleanup
    rm -rf "/tmp/gcc-${GCC_VERSION}" "/tmp/gcc-build" "/tmp/gcc-${GCC_VERSION}.tar.xz"

# Make the newly installed GCC default
RUN set -eux; \
    if [ -x "${PREFIX}/bin/gcc" ] && [ -x "${PREFIX}/bin/g++" ]; then \
      update-alternatives --install /usr/bin/gcc gcc "${PREFIX}/bin/gcc" 120 \
        --slave /usr/bin/g++ g++ "${PREFIX}/bin/g++"; \
      update-alternatives --set gcc "${PREFIX}/bin/gcc"; \
      printf 'export CC=gcc\nexport CXX=g++\n' > /etc/profile.d/compiler.sh; \
      chmod 0644 /etc/profile.d/compiler.sh; \
    else \
      echo "ERROR: ${PREFIX}/bin/gcc or g++ not found after install" >&2; \
      exit 1; \
    fi

# Loader config
RUN set -eux; \
    echo "${PREFIX}/lib64" > /etc/ld.so.conf.d/gcc.conf; \
    ldconfig


USER user
WORKDIR /home/user/ptxproj

