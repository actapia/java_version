#!/usr/bin/env bash
readonly JDKS=("/opt/jdk-11.0.10+9" "/opt/jdk-12.0.2+10" "/opt/jdk-13.0.2+8" "/opt/jdk-15.0.2" "/usr/java/jdk1.7.0_67-cloudera")
declare -A JDK_AA
for jdk in "${JDKS[@]}"; do
    name="$(basename "$jdk")"
    JDK_AA["$name"]="$jdk"
done
