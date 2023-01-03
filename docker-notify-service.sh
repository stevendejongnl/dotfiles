#! /bin/bash

if [[ "$1" == "-v" ]] || [[ "$1" == "--verbose" ]]; then
    echo "Verbose mode"
    ansible-playbook --ask-become-pass --verbose roles.yml --tags "docker-notify"
    exit 0
fi

if  [[ "$1" == "--dry" ]]; then
    echo "Dry run"
    ansible-playbook --ask-become-pass --verbose --check --diff roles.yml --tags "docker-notify"
    exit 0
fi

ansible-playbook --ask-become-pass roles.yml --tags "docker-notify"
