
#! /bin/bash
#

git subtree push --prefix=kiss git@github.com:kiss-lang/kiss.git main

libs=$(ls libraries)

for lib in $libs; do
	if [ $lib = "_deprecated" ]; then continue; fi
	if [ $lib = "_standalone" ]; then continue; fi

	git subtree push --prefix=projects/$lib git@github.com:kiss-lang/$lib.git main
done
