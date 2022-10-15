#DEPLOY http-echo helm chart
```install http-echo under a dedicated namespace
helm lint
helm install http-echo --namespace http-echo --create-namespace .

```install http-echo in default namespace
helm lint
helm install http-echo .

##Testing
- `curl http://localhost:8080`
- `curl http://localhost:8081`

##Known issue
- instance1 route through nginx ingress controller
- instance2 use nodePort 30081 and forward by KIND port mapping, as port based routing is not supported by ingress
