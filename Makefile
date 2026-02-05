setup-cluster:
	idpbuilder create --dev-password -p ./setup
	make patch-argocd

setup-demo:
	idpbuilder create --dev-password -p ./setup -p ./demo
	make patch-argocd

patch-argocd:
	kubectl -n argocd patch --patch-file argocd-patch.yaml deployment/argocd-server