#!/bin/sh

VALUES="values.yaml"

curl -fks --connect-timeout 5 https://git.jupiter.mein.nl \
    || extra_args="--values values-seed.yaml"

helm template \
    --include-crds \
    --namespace argocd \
    --values "${VALUES}" \
    argocd . \
    | kubectl apply -n argocd -f -
