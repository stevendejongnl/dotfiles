#! /bin/bash

ansible-playbook --ask-become-pass install -r roles/requirements.yml roles.yml

