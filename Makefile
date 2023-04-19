
build:
	./build.sh

start:
	./start-server.sh

stop:
	./stop-server.sh

backup:
	docker exec ark-ded arkmanager backup

backup-every-5:
	while sleep 300; do docker exec ark-ded arkmanager backup; done

watch-netstat:
	watch -n1 "netstat -4apn | grep ShooterGame"

