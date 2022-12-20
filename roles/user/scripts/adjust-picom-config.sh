#! /bin/bash

if [[ "$1" == "--file" ]]; then
    filename="$2"
    search='backend = "glx";'
    replace='backend = "xrender";'

    if [[ "$3" == "--environment" ]] && [[ "$4" == "host" ]]; then
        replace='backend = "glx";\nvsync = true;'
    elif [[ "$3" == "--environment" ]] && [[ "$4" == "guest" ]]; then
        replace='backend = "xrender";'
    fi

    sed "s/$search/$replace/" $filename | tee $filename.tmp

    if [[ "$5" == "--picom" ]]; then
        mkdir -p "$6"
        mv "$filename.tmp" "$6/picom.conf"
    fi
fi
