#!/usr/bin/env bash
source optionsh.sh
declare -A MYARGS
if [ -z "$CMD_NAME" ]; then
    CMD_NAME=$0
fi
parse_args "$CMD_NAME" MYARGS "$1"
parse_result=$?
if [ $parse_result -ne 0 ]; then
    exit $parse_result
fi
set -e
case "${MYARGS[command]}" in
    "ls")
	CMD_NAME="$CMD_NAME ls" bash java_version_list.sh "${@:2}"
	exit 102
	;;
    "set")
	# Set both home and path.
	CMD_NAME="$CMD_NAME set" bash java_version_set_home.sh "${@:2}"
	CMD_NAME="$CMD_NAME set" bash java_version_set_path.sh "${@:2}"
	;;
    "set_home")
	CMD_NAME="$CMD_NAME set_home" bash java_version_set_home.sh "${@:2}"
	;;
    "set_path")
	CMD_NAME="$CMD_NAME set_path" bash java_version_set_path.sh "${@:2}"
	;;
    *)
	>&2 echo "Unrecognized command ${MYARGS[command]}."
	exit 1	
esac
