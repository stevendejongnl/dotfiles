#! /bin/bash

if [[ "$s1" == "--directory" ]]
    mkdir -p $2

    curl -o "$2/lucas-segers-6mNKUrwMwFk-unsplash.jpg" "https://unsplash.com/photos/6mNKUrwMwFk/download?ixid=MnwxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjcxNTU1MTE5&force=true"
fi
