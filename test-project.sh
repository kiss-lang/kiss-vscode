#! /bin/bash

KISS_PROJECT=${KISS_PROJECT:-$1}
KISS_PROJECT=${KISS_PROJECT:-bad-nlp}

if [ -n "$CI_OS_NAME" ]; then
    (cd projects/$KISS_PROJECT && lix download)
fi
(cd projects/$KISS_PROJECT && ./test.sh "${@:2}")