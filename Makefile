
build:
	./build.sh

start:
	./start-server.sh

stop-without-backup:
	./stop-server.sh

backup:
	./backup-server.sh

stop: | backup stop-without-backup

poll-server-online:
	./poll-server-online.sh

backup-every-5:
	while sleep 300; do ./backup-server.sh; done

start-and-backup: | start poll-server-online backup-every-5

logs:
	docker logs -f ark-ded

watch-netstat:
	watch -n1 "netstat -4apn | grep ShooterGame"

