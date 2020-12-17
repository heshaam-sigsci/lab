DOCKERUSER?=sigsci
DOCKERNAME?=sigsci-kong
DOCKERTAG?=latest
EXPOSE_PORT?=8383
AGENT_CONF?=$(shell pwd)/agent.conf

build:
	docker build -t $(DOCKERUSER)/$(DOCKERNAME):$(DOCKERTAG) .

build-no-cache:
	docker build --no-cache -t $(DOCKERUSER)/$(DOCKERNAME):$(DOCKERTAG) .

run:
	docker run -v $(AGENT_CONF):/etc/sigsci/agent.conf --name $(DOCKERNAME) --network=kong-net -e "KONG_DATABASE=postgres" -e "KONG_PG_HOST=kong-database" -e "KONG_PG_PASSWORD=kong" -e "KONG_CASSANDRA_CONTACT_POINTS=kong-database" -e "KONG_PROXY_ACCESS_LOG=/dev/stdout" -e "KONG_ADMIN_ACCESS_LOG=/dev/stdout" -e "KONG_PROXY_ERROR_LOG=/dev/stderr" -e "KONG_ADMIN_ERROR_LOG=/dev/stderr" -e "KONG_ADMIN_LISTEN=0.0.0.0:8001, 0.0.0.0:8444 ssl" -p 8000:8000 -p 8443:8443 -p 8001:8001 -p 8444:8444 -p $(EXPOSE_PORT):80 -d $(DOCKERUSER)/$(DOCKERNAME)

deploy:
	docker push $(DOCKERUSER)/$(DOCKERNAME):$(DOCKERTAG)
	
clean:
	-docker kill $(DOCKERNAME)
	-docker rm $(DOCKERNAME)

destroy:
	-docker kill $(DOCKERNAME)
	-docker rm $(DOCKERNAME)
-docker rmi $(DOCKERUSER)/$(DOCKERNAME):$(DOCKERTAG)
