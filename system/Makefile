.POSIX:

export KUBECONFIG = $(shell pwd)${HOME}/.kube/config

.PHONY: bootstrap
bootstrap:
	ansible-playbook \
		bootstrap.yml
