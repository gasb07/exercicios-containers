kubectl create ns marketing
kubectl create ns webapp
kubectl create deployment bigapp --replicas 5 --image nginx:latest -n webapp