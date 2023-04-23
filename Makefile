
build:
	./build.sh

start:
	./start-server.sh

stop:
	./stop-server.sh

backup:
	./backup-server.sh

backup-every-5:
	while sleep 300; do ./backup-server; done

watch-netstat:
	watch -n1 "netstat -4apn | grep ShooterGame"

