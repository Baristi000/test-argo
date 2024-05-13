server=https://localhost:8443
# the name of the secret containing the service account token goes here
name=argo-test

ca=$(kubectl get secret/$name -n cicd -o jsonpath='{.data.ca\.crt}')
token=$(kubectl get secret/$name -n cicd -o jsonpath='{.data.token}' | base64 --decode)
namespace=cicd

echo "
apiVersion: v1
kind: Config
clusters:
- name: default-cluster
  cluster:
    certificate-authority-data: ${ca}
    server: ${server}
contexts:
- name: default-context
  context:
    cluster: default-cluster
    namespace: default
    user: default-user
current-context: default-context
users:
- name: default-user
  user:
    token: ${token}
" > sa.kubeconfig