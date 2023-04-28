#! /bin/bash

KISS_PROJECT=${KISS_PROJECT:-$1}
KISS_PROJECT=${KISS_PROJECT:-bad-nlp}

if [ -n "$CI_OS_NAME" ]; then
    if [ ! -d projects/$KISS_PROJECT ]; then
        (cd projects && git clone https://github.com/kiss-lang/$KISS_PROJECT)
    fi
    (cd projects/$KISS_PROJECT && lix download)
fi
(cd projects/$KISS_PROJECT && ./test.sh "${@:2}")