#!/usr/bin/env bash
source optionsh.sh
declare -A MYARGS
if [ -z "$CMD_NAME" ]; then
    CMD_NAME=$0
fi
parse_args "$CMD_NAME" MYARGS "$@"
parse_result=$?
if [ $parse_result -ne 0 ]; then
    exit $parse_result
fi
source java_versions.sh
for jdk in "${!JDK_AA[@]}"; do
    echo "$jdk ${JDK_AA[$jdk]}"
done | column -t -s' '
