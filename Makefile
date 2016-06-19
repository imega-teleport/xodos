IMAGE = imegateleport/xodos
CONTAINERS = teleport_webhook
PORT = -p 8186:80

build:
	@docker build -t $(IMAGE) .

start:
	@docker run -d --name teleport_webhook \
		-v /root/.dockercfg:/root/.dockercfg \
		-v /tmp:/tmp \
		-v /var/run/docker.sock:/var/run/docker.sock \
		--restart=always
		$(PORT) $(IMAGE)

stop:
	@-docker stop $(CONTAINERS)

clean: stop
	@-docker rm -fv $(CONTAINERS)

destroy: clean
	@-docker rmi -f $(IMAGE)
