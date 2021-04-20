#!/usr/bin/env bash
source java_versions.sh
for jdk in "${!JDK_AA[@]}"; do
    printf "$jdk "
done
