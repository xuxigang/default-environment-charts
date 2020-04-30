CHART_REPO := http://jenkins-x-chartmuseum:8080
DIR := "env"
NAMESPACE := "change-me"
OS := $(shell uname)

build: clean
	rm -rf requirements.lock
	helm version
	helm init --client-only --stable-repo-url  https://mirror.azure.cn/kubernetes/charts/
	helm repo add releases ${CHART_REPO}
	helm dependency build ${DIR}
	helm package ${DIR}
	helm lint ${DIR}

install: 
	helm upgrade ${NAMESPACE} ${DIR} --install --namespace ${NAMESPACE} --debug

delete:
	helm delete --purge ${NAMESPACE}  --namespace ${NAMESPACE}

clean:


