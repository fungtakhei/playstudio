# Create a Helm chart to deploy an application

## You Will Need

- [Helm 3](https://helm.sh/docs/intro/install/)
- Docker
  - [Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows/)
  - [macOS](https://hub.docker.com/editions/community/docker-ce-desktop-mac/)
- [_Optional_ - Kind](https://kind.sigs.k8s.io/docs/user/quick-start/)

---

## Setup

Once the above tooling is installed, and if you don't have a Kubernetes cluster available, create your Kubernetes cluster with Kind and deploy an ingress controller.

> If you already have a Kubernetes cluster, skip to the ___Task___ section

### Bash

```Bash
kind create cluster --config ./resources/cluster.yaml --image kindest/node:v1.25.2

kubectl apply -f ./resources/ingress.yaml

kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s
```

Once the cluster is setup, `http://localhost:8080` should return a 404 error.

### Powershell

```Powershell
kind create cluster --config ./resources/cluster.yaml --image kindest/node:v1.25.2

kubectl apply -f ./resources/ingress.yaml

kubectl wait --namespace ingress-nginx `
  --for=condition=ready pod `
  --selector=app.kubernetes.io/component=controller `
  --timeout=90s
```

Once the cluster is setup, `http://localhost:8080` should return a 404 error.

---

## Task

- Create a Helm chart to deploy two instances of the `http-echo` application
- Both instances will run the image `hashicorp/http-echo:0.2.3`
- Both instances require the following arguments
  - `--text=hello`
- One instance of the application will be deployed through a `Deployment` while the other will be a `StatefulSet`
- One instance of the application will listen on port `8080` and the other on `8081`
- The Helm chart must include the following resources at a minimum
  - Ingress
  - Deployment
- Think about what else should be in a **production ready** chart

---

## Testing

- `helm lint` must not fail
- When deployed to the cluster, `curl http://localhost:8080` and `curl http://localhost:8081` must return `hello`
