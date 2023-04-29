#! /bin/bash

KISS_TARGET=${KISS_TARGET:-$1}
KISS_TARGET=${KISS_TARGET:-interp}

# If Travis is running tests, basic dependencies need to be installed
if [ -n "$CI_OS_NAME" ]
then
    lix download
fi

# Test projects with test-project.sh
if [ -n "$KISS_PROJECT" ]
then
    ./test-project.sh
# Test Kiss with utest cases in kiss/src/test/cases
else
    git clone https://github.com/kiss-lang/kiss
    if [ ! -z "$2" ]; then
        haxe -D cases=$2 kiss/build-scripts/common-args.hxml kiss/build-scripts/common-test-args.hxml kiss/build-scripts/$KISS_TARGET/test.hxml
    else
        haxe kiss/build-scripts/common-args.hxml kiss/build-scripts/common-test-args.hxml kiss/build-scripts/$KISS_TARGET/test.hxml
    fi
fi
