#! /bin/bash

VERBOSE=''
CHECK=''

while getopts verbose:check: flag
do
    case "${flag}" in
        verbose) VERBOSE='--verbose';;
        check) CHECK='--check';;
    esac
done

ansible-playbook --ask-become-pass $VERBOSE $CHECK roles.yml
