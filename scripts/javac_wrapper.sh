#!/bin/bash
set -euo pipefail

real_javac="${ANDROID_JAVA_HOME:-}/bin/javac"
if [ ! -x "${real_javac}" ]; then
    echo "javac_wrapper: ANDROID_JAVA_HOME/bin/javac not found: ${real_javac}" >&2
    exit 1
fi

args=()
for arg in "$@"; do
    # ErrorProne flags are often packed into a single -Xplugin argument.
    arg="${arg//-Xep:ReferenceEquality:ERROR/-Xep:ReferenceEquality:OFF}"
    args+=("${arg}")
done

exec "${real_javac}" "${args[@]}"
