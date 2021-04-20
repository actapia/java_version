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
set -e
if [ -z "${JDK_AA[${MYARGS[version]}]}" ]; then
    >&2 echo "Unrecognized version ${MYARGS[version]}"
    exit 1
fi
bin_path="${JDK_AA[${MYARGS[version]}]}/bin"
NEW_PATH=""
if [ -z "$JV_CURRENT_PATH" ]; then
    NEW_PATH="$bin_path:$PATH"
else
    IFS=":"
    for comp in $PATH; do
	if [ "$comp" = "$JV_CURRENT_PATH" ]; then
	    comp="$bin_path"
	fi
	if [ -z "$NEW_PATH" ]; then
	    NEW_PATH="$comp"
	else
	    NEW_PATH="$NEW_PATH:$comp"
	fi
    done
fi
echo "JV_CURRENT_PATH=$bin_path"
echo "PATH=$NEW_PATH"
