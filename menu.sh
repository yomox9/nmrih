#!/bin/bash

select ans in "status" "get_server_files" "make_setting" "install_config" "run NP25S" "run ThinkpadX31" "run ThinkpadX60" "get_config" "delete" "git_push" "quit"
do
	echo ======================================================
	if [ -z "$ans" ];then
		continue
	
	else
		case "$ans" in
			"status" )
				./status.sh;;
			"get_server_files" )
				echo really?; select ans in "yes" "no"; do if [ "$ans" = "yes" ];then
					./get_nmrihserver.sh
				fi; break; done
				;;
			"make_setting" )
				echo really?; select ans in "yes" "no"; do if [ "$ans" = "yes" ];then
					./make_setting.sh
				fi; break; done
				;;
			"install_config" )
				echo really?; select ans in "yes" "no"; do if [ "$ans" = "yes" ];then
					./install_confdig.sh
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
			"get_config" )
				./get_config.sh
				;;
			"delete" )
				echo really?; select ans in "yes" "no"; do if [ "$ans" = "yes" ];then
					./delete.sh
				fi; break; done
				;;
			"git_push" )
				./git_push.sh
				;;
			"quit" )
				break;;
		esac
	fi
done

echo ans=$ans
