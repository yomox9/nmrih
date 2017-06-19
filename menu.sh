#!/bin/bash
shellver="2017/06/18 ver0.02 fix"
shellver="2017/06/16 ver0.01 first version"

select ans in "status" "get_package" "get_server_files" "make_setting" "install_config" "run server" "run np25s" "run ThinkpadX31" "run ThinkpadX60" "get_config" "delete" "get_map" "git_push" "quit"
do
	echo ======================================================
	if [ -z "$ans" ];then
		continue
	
	else
		case "$ans" in
			"status" )
				echo shellver=$shellver
				./status.sh;;
			"get_package" )
				echo really?; select ans in "yes" "no"; do if [ "$ans" = "yes" ];then
					./get_package.sh
				fi; break; done
				;;
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
					./install_config.sh
				fi; break; done
				;;
			"run server" )
				./run_nmrih_server.sh
				;;
			"run np25s" )
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
			"get_map" )
				./get_map.sh
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
