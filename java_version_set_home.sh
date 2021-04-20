#!/usr/bin/env bash
source optionsh.sh
if [ -z "$CMD_NAME" ]; then
    CMD_NAME=$0
fi
parse_args "$CMD_NAME" MYARGS "$@"
parse_result=$?
if [ $parse_result -ne 0 ]; then
    exit $parse_result
fi
source java_versions.sh
if [ -z "${JDK_AA[${MYARGS[version]}]}" ]; then
    >&2 echo "Unrecognized version ${MYARGS[version]}"
    exit 1
fi
echo "JAVA_HOME=${JDK_AA[${MYARGS[version]}]}"
