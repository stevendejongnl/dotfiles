#! /bin/bash

while getopts verbose:check: flag
do
    case "${flag}" in
        verbose) VERBOSE='--verbose';;
        check) CHECK='--check';;
    esac
done

${VERBOSE:-''}
${CHECK:-''}

ansible-playbook --ask-become-pass $VERBOSE $CHECK roles.yml
