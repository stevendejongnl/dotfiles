#! /bin/bash

while getopts -v:--verbose:-c:--check: flag
do
    case "${flag}" in
        -v | --verbose) VERBOSE=${OPTARG};;
        -c | --check) CHECK=${OPTARG};;
    esac
done

${VERBOSE:-''}
${CHECK:-''}

ansible-playbook --ask-become-pass $VERBOSE $CHECK roles.yml
