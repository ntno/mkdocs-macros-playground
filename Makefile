SHELL:=/bin/bash


#################################################################
# run from local machine
#################################################################
stop: 
	docker-compose down --remove-orphans

#no buildenv used
serve:
	export MULTI_ENV_VARIABLE="beep" && \
	export ENV_SPECIFIC_VARIABLE="boop" && \
	export DATA_CENTER_SPECIFIC_VARIABLE="yeet" && \
	docker-compose run -e MULTI_ENV_VARIABLE="$$MULTI_ENV_VARIABLE" \
						-e ENV_SPECIFIC_VARIABLE="$$ENV_SPECIFIC_VARIABLE" \
						-e DATA_CENTER_SPECIFIC_VARIABLE="$$DATA_CENTER_SPECIFIC_VARIABLE" \
						--service-ports local_development_server 

# for unix environment with python installed
docker: 
	docker-compose -f unix.yml run --rm unix

open: 
	open http://0.0.0.0:7000


##############################################################################
# run from docker container or local machine if buildenv is installed locally
##############################################################################
load-env: check-env check-region
	eval "$$(buildenv -e $(env) -d $(region))" 

exec-build-env: check-env check-region
	buildenv -e $(env) -d $(region)

#################################################################


check-env:
ifndef env
	$(error env is not defined)
endif

check-region:
ifndef region
	$(error region is not defined)
endif
