#!/usr/bin/env bash
_jv_complete()
{
    local cur prev

    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}

    case ${COMP_CWORD} in
        1)
            COMPREPLY=($(compgen -W "ls set set_home set_path" -- ${cur}))
            ;;
        2)
            case ${prev} in
                "set"*)
                    COMPREPLY=($(compgen -W "$(bash print_jdks.sh)" -- ${cur}))
                    ;;
                *)
                    :
                    ;;
            esac
            ;;
        *)
            COMPREPLY=()
            ;;
    esac
}

complete -F _jv_complete "java_version"

