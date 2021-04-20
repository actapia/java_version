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
echo "JAVA_HOME=$JAVA_HOME"
java --version
exit 102
