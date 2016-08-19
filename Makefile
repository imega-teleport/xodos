include vars.mk

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
<<<<<<< HEAD
		-e WEBHOOK=$(WEBHOOK) \
=======
		--restart=always \
>>>>>>> bedd4170193bd41052544c56ca26d0f8a489a259
		$(PORT) $(IMAGE)

stop:
	@-docker stop $(CONTAINERS)

clean: stop
	@-docker rm -fv $(CONTAINERS)

destroy: clean
	@-docker rmi -f $(IMAGE)
