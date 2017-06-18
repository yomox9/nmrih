#!/bin/sh -x
if [ -n $1 ];then
	git add $1
	git commit -m add_$1
	git push nmrih
fi
