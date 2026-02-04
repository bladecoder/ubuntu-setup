#!/bin/bash

AVAILABLE_DBS=("MySQL" "Redis" "PostgreSQL" "Done")
SELECTED_DBS=()
echo "Select databases to run (enter the number, one at a time, then select 'Done' to finish):"
PS3="Database: "
select db in "${AVAILABLE_DBS[@]}"; do
	if [[ "$db" == "Done" ]]; then
		break
	elif [[ -n "$db" ]]; then
		SELECTED_DBS+=("$db")
		echo "$db selected."
	fi
done

for db in "${SELECTED_DBS[@]}"; do
	case $db in
	MySQL)
		sudo docker run -d --restart unless-stopped -p "127.0.0.1:3306:3306" --name=mysql8 -e MYSQL_ROOT_PASSWORD= -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql:8.4
		;;
	Redis)
		sudo docker run -d --restart unless-stopped -p "127.0.0.1:6379:6379" --name=redis redis:7
		;;
	PostgreSQL)
		sudo docker run -d --restart unless-stopped -p "127.0.0.1:5432:5432" --name=postgres16 -e POSTGRES_HOST_AUTH_METHOD=trust postgres:16
		;;
	esac
done
