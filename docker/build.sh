#!/bin/bash

set -e

TOOLCHAIN_PATH="/opt/gcc-Toolchain-2022.08-wago.1/LINARO.Toolchain-2022.08-wago.1/aarch64-linux-gnu/bin"


print_usage() {
    cat << EOF
build, (c) 2024 WAGO GmbH & Co. KG
Usage:
    build init | build | images | help
Commands:
    init    initialize project
    build   build all packages
    images  build images
    wup     create WUP file
EOF
}

case "$1" in
    -h | --help | help)
        print_usage
        ;;
    init)
        echo "Setup PTXdist project"
        ptxdist select configs/wago-wp400/ptxconfig_wp400
        ptxdist platform configs/wago-wp400/platformconfig
        ptxdist toolchain $TOOLCHAIN_PATH
        ptxdist clean -q
        ;;
    build | "")
        ptxdist go -q -j -n19
        ;;
    get)
        ptxdist select configs/wago-wp400/ptxconfig_wp400
        ptxdist platform configs/wago-wp400/platformconfig
        ptxdist toolchain $TOOLCHAIN_PATH
        ptxdist get -q
        ;;
    images)
        ptxdist images -q
        ;;
    wup)
        make wup
        ;;
    *)
        echo "error: unknown command" 1>&2
        exit 1
        ;;
esac
