
## check nodes
````
kubectl get nodes
````

## create pod using command
````
kubectl run pod-1 --image=nginx
````
## Create pod with yaml script
````
apiVersion: v1 
kind: Pod 
metadata: 
  name: pod-1
  labels: 
    app: nginx 

spec: 
  containers: 
  - name: cont-1
    image: nginx
    ports:
    - containerPort: 80
````

## list pods
````
kubectl get pods
````

## access app inside pod
````
kubectl expose pod pod-1 --port=80 --target-port=80 --type=ClusterIP
````
## create service with yaml script

````
apiVersion: v1
kind: Service
metadata: 
  name: svc-nginx 
spec: 
  selector: 
    app: nginx
  ports:
  - protocol: "TCP"
    port: 80
    targetPort: 80
  type: NodePort
````
````
kubectl exec -it pod-1  -- curl 10.12.24.43
````
