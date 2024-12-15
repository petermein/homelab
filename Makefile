.POSIX:
.PHONY: *
.EXPORT_ALL_VARIABLES:

KUBECONFIG = ${HOME}/.kube/config
KUBE_CONFIG_PATH = $(KUBECONFIG)

default: metal system external smoke-test post-install clean

configure:
	./scripts/configure
	git status

metal:
	make -C metal

system:
	make -C system

external:
	make -C external

smoke-test:
	make -C test filter=Smoke

post-install:
	@./scripts/hacks

<<<<<<< HEAD
# TODO maybe there's a better way to manage backup with GitOps?
backup:
	./scripts/backup --action setup --namespace=actualbudget --pvc=actualbudget-data
	./scripts/backup --action setup --namespace=jellyfin --pvc=jellyfin-data

restore:
	./scripts/backup --action restore --namespace=actualbudget --pvc=actualbudget-data
	./scripts/backup --action restore --namespace=jellyfin --pvc=jellyfin-data
=======
tools:
	@docker run \
		--rm \
		--interactive \
		--tty \
		--network host \
		--volume "/var/run/docker.sock:/var/run/docker.sock" \
		--volume $(shell pwd):$(shell pwd) \
		--volume ${KUBECONFIG}:/root/.kube/config \
		--volume ${HOME}/.ssh:/root/.ssh \
		--volume ${HOME}/.terraform.d:/root/.terraform.d \
		--volume homelab-tools-cache:/root/.cache \
		--volume homelab-tools-nix:/nix \
		--workdir $(shell pwd) \
		--entrypoint /bin/sh \
		docker.io/nixos/nix -c "\
		git config --global --add safe.directory $(shell pwd) && \
		nix --experimental-features 'nix-command flakes' develop"
>>>>>>> 162a814 (Initial config)

test:
	make -C test

clean:
	docker compose --project-directory ./metal/roles/pxe_server/files down

docs:
	mkdocs serve

git-hooks:
	pre-commit install
