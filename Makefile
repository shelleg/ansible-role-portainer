SHELL=/bin/bash
TESTIMAGENAME=molecule-test

test: build-testimage
	docker run --rm -it \
		-v '${PWD}':/tmp/ansible-role-portainer \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-w /tmp/ansible-role-portainer \
		${TESTIMAGENAME} \
		sudo molecule test
		# sudo molecule init scenario -r ${ROLENAME} -s default -d docker

build-testimage:
	docker build -t ${TESTIMAGENAME} .
