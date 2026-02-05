Requires idpbuilder - https://github.com/cnoe-io/idpbuilder/


Setup Cluster:
`make setup-cluster`

Setup Demo App:
`make setup-demo`

argo: https://argocd.cnoe.localtest.me:8443
kiali (traffic graphs): https://kiali.cnoe.localtest.me:8443
prometheus: https://prometheus.cnoe.localtest.me:8443/
httpbin: https://api.cnoe.localtest.me:8443/

to simulate a rollout, update version label in ./demo/manifests/httpbin.yaml
to simulate success, `curl -k https://api.cnoe.localtest.me:8443/status/200` while canary is running
to simulate failure, `curl -k https://api.cnoe.localtest.me:8443/status/500` while canary is running

additionally, to demonstrate how the weighted routes applied to the api service enforces these 
trafficshaping rules for both traffic coming from the ingress gateway & intra-cluster traffic

`kubectl -n curl exec -it deployment/curl -- sh`

from there you can run `curl ${HTTPBIN_SVC}` or `curl ${HTTPBIN_SVC}/status/200` or `curl ${HTTPBIN_SVC}/status/500`