# pod-1
````
vim green.yaml
````
````
apiVersion: v1 
kind: Pod
metadata: 
  name: pod-green
  labels: 
    app: green
spec: 
  containers:
   - name: c1 
     image: abhipraydh96/green
     ports:
     - containerPort: 80

---
apiVersion: v1
kind: Service 
metadata: 
   name: svc-green
spec: 
  selector: 
    app: green
  ports:
   - protocol: "TCP"
     port: 80
     targetPort: 80
````
````
kubectl apply -f green.yaml
````
````
kubectl get pods
kubectl get svc
````
---

# pod-2
````
vim blue.yaml
````
````
apiVersion: v1 
kind: Pod
metadata: 
  name: pod-blue
  labels: 
    app: blue
spec: 
  containers:
   - name: c1 
     image: abhipraydh96/blue 
     ports:
     - containerPort: 80

---
apiVersion: v1
kind: Service 
metadata: 
   name: svc-blue
spec: 
  selector: 
    app: blue 
  ports:
   - protocol: "TCP"
     port: 80
     targetPort: 80
````
````
kubectl apply -f blue.yaml
````
````
kubectl get pods
kubectl get svc
````

---
# access pod blue from pod green
````
kubectl exec -it pod-green -- curl svc-blue
````
# access pod green from pod blue
````
kubectl exec -it pod-blue -- curl svc-green
````
