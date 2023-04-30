#! /bin/bash

KISS_TARGET=${KISS_TARGET:-$1}
KISS_TARGET=${KISS_TARGET:-interp}

# Test projects with test-project.sh
if [ -n "$KISS_PROJECT" ]
then
    ./test-project.sh
# Test Kiss with utest cases in kiss/src/test/cases
else
    # If CI is running tests, basic dependencies need to be installed
    if [ -n "$CI_OS_NAME" ]
    then
        git clone https://github.com/kiss-lang/kiss
        (cd kiss && lix download)
        if [ "$KISS_TARGET" = cpp ]; then
            lib install haxelib:hxcpp
        elif [ "$KISS_TARGET" = nodejs ]; then
            lix install haxelib:hxnodejs
        fi
    fi

    if [ ! -z "$2" ]; then
        (cd kiss && haxe -D cases=$2 build-scripts/common-args.hxml build-scripts/common-test-args.hxml build-scripts/$KISS_TARGET/test.hxml)
    else
        (cd kiss && haxe build-scripts/common-args.hxml build-scripts/common-test-args.hxml build-scripts/$KISS_TARGET/test.hxml)
    fi
fi
