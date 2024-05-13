argocd app create redis \
    --repo registry-1.docker.io/bitnamicharts \
    --helm-chart redis \
    --revision 19.3.1 \
    --dest-namespace develop \
    --dest-name default-context
