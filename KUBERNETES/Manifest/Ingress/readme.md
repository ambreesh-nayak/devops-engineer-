### Create a minikube cluster

### Enable the Ingress controller
````
minikube addons enable ingress
````
````
kubectl get pods -n ingress-nginx
````
### Deploy a hello, world app
````
kubectl create deployment web --image=gcr.io/google-samples/hello-app:1.0
````

````
kubectl get deploy
````

### Expose the Deployment
````
kubectl expose deployment web --type=NodePort --port=8080
````

````
kubectl get service
````

### Visit the Service
````
minikube service web --url
````
-example: curl http://172.17.0.15:31637 

### 
