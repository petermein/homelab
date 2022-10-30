.POSIX:

env ?= "prod"

default: boot os cluster

# ~/.ssh/id_ed25519:
# 	ssh-keygen -t ed25519 -f "$@"

boot: ~/.ssh/id_ed25519
	ansible-playbook \
		--inventory inventories/${env}.yml \
		boot.yml

picm: ansible-playbook \
		--inventory inventories/${env}.yml \
		cluster.yml

cluster:
	ansible-playbook \
		--inventory inventories/${env}.yml \
		cluster.yml

console:
	ansible-console \
		--inventory inventories/${env}.yml
