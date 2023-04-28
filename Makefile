
build:
	./build.sh

start:
	./start-server.sh

stop-without-backup:
	./stop-server.sh

backup:
	./backup-server.sh

stop: | backup stop-without-backup

wait-for-server-listen:
	@echo -n "Waiting for server..."
	@while [ "$$(docker exec ark-ded bash -c "arkmanager status | perl -pe 's/\x1b\[[^\x1b]*m//g' | grep -oPie 'Server online:\s*\K\w+'" 2>/dev/null)" != "Yes" ]; do printf "."; sleep 10; done
	@printf "\nServer is up!\n"

backup-every-5:
	while sleep 300; do ./backup-server.sh; done

start-and-backup: | start wait-for-server-listen backup-every-5

logs:
	docker logs -f ark-ded

watch-netstat:
	watch -n1 "netstat -4apn | grep ShooterGame"

