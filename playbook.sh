#! /bin/bash

VERBOSE=''
CHECK=''
DIFF=''

while getopts verbose:check:diff: flag
do
    case "${flag}" in
        verbose) VERBOSE='--verbose';;
        check) CHECK='--check';;
        diff) DIFF='--diff';;
    esac
done

ansible-playbook --ask-become-pass $VERBOSE $CHECK $DIFF roles.yml
