#! /bin/bash

if [[ "$s1" == "-v" ]] || [[ "$s1" == "--verbose" ]]; then
    echo "Verbose mode"
    ansible-playbook --ask-become-pass --verbose roles.yml
    exit 0
fi

ansible-playbook --ask-become-pass roles.yml
