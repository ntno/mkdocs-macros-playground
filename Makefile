SHELL:=/bin/bash

stop: 
	docker-compose down --remove-orphans

serve:
	docker-compose run --service-ports local_development_server

# for unix environment with python installed
docker: 
	docker-compose -f unix.yml run --rm unix

open: 
	open http://0.0.0.0:7000
