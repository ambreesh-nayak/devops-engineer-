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


### Create a second Deployment 
````
kubectl create deployment web2 --image=gcr.io/google-samples/hello-app:2.0
````
````
kubectl get deploy
````
### Expose the  Second Deployment
````
kubectl expose deployment web2 --port=8080 --type=NodePort
````

### Create an Ingress
````
vim ingress.yaml
````
````
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: example-ingress
spec:
  ingressClassName: nginx
  rules:
    - host: hello-world.example
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: web
                port:
                  number: 8080
          - path: /v2
            pathType: Prefix
            backend:
              service:
                name: web2
                port:
                  number: 8080
````
````
kubectl apply -f ingress.yaml
````

### final output
````
curl --resolve "hello-world.example:80:$( minikube ip )" -i http://hello-world.example
````
````
curl --resolve "hello-world.example:80:$( minikube ip )" -i http://hello-world.example/v2
````


