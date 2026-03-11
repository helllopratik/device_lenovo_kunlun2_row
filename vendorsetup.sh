#!/bin/bash

# Build-time only toggle for this device tree.
# This does not alter boot/runtime behavior on the final image.
export BUILD_FROM_SOURCE_STUB=true

# Build-time only Java wrapper: keep upstream sources untouched while
# neutralizing a strict ErrorProne check that currently breaks Bluetooth.
_KUNLUN2_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export ALTERNATE_JAVAC="${_KUNLUN2_DIR}/scripts/javac_wrapper.sh"
unset _KUNLUN2_DIR
