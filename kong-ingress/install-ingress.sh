#!/bin/zsh

kubectl create namespace kong

kubectl annotate ns kong kuma.io/sidecar-injection="enabled"

kubectl annotate ns kong kuma.io/mesh="demo"

helm repo add kong https://charts.konghq.com

helm repo update

helm install kong/kong --generate-name \
    --namespace kong \
    -f values.yaml \
    --set ingressController.installCRDs=false
