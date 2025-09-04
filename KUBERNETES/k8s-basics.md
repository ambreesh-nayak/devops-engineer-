
## check nodes
````
kubectl get nodes
````

## create pod
````
kubectl run pod-1 --image=nginx
````

## list pods
````
kubectl get pods
````

## access app inside pod
````
kubectl expose pod pod-1 --port=80 --target-port=80 --type=ClusterIP
````

````
kubectl exec -it pod-1  -- curl 10.12.24.43
````
