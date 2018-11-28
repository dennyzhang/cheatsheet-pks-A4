How to run kubectl command

- Create a cluster

```
# In jumpbox
pks create-cluster cluster1 --external-hostname cluster1.pks.com --plan "plan 1" --num-nodes 1

# This should take a while

pks cluster cluster1
```

- Update /etc/hosts in your jumpbox

```
$k8s_masterip cluster1.pks.com
```

- Get kubectl context

```
pks get-credentials cluster1

kubectl get nodes
```