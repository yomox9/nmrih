#!/bin/bash

select ans in "status" "get" "run NP25S" "run ThinkpadX31" "run ThinkpadX60" "delete" "quit"
do

	if [ -z "$ans" ];then
		continue
	
	else
		case "$ans" in
			"status" )
				./status.sh;;
			"get" )
				echo really?; select ans in "yes" "no"; do if [ "$ans" = "yes" ];then
					./get_nmrihserver.sh
				fi; break; done
				;;
			"run NP25S" )
				./run_nmrih_server.sh 192.168.112.80 27080 server_np25s.cfg
				;;
			"run ThinkpadX31" )
				./run_nmrih_server.sh 192.168.112.81 27081 server_thinkpadx31.cfg
				;;
			"run ThinkpadX60" )
				./run_nmrih_server.sh 192.168.112.82 27082 server_thinkpadx60.cfg
				;;
			"delete" )
				echo really?; select ans in "yes" "no"; do if [ "$ans" = "yes" ];then
					./delete.sh
				fi; break; done
				;;
			"quit" )
				break;;
		esac
	fi
done

echo ans=$ans
