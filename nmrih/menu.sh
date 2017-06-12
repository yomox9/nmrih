#!/bin/bash

select ans in "status" "get" "run" "delete" "quit"
do

	if [ -z "$ans" ];then
		continue
	
	else
		case "$ans" in
			"status" )
				./status.sh;;
			"get" )
				./get_nmrihserver.sh;;

			"run" )
				./run_nmrih_server.sh;;
			"delete" )
				./delete.sh;;
			"quit" )
				break;;
		esac
	fi
done

echo ans=$ans
