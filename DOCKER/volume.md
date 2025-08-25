
# Docker Volume

## create docker volume
````
docker volume create myvol
````

## list docker volume 
````
docker volume ls
````
## get vol details
````
docker inspect volume myvol
````


## pull image from dockerhub(ubuntu)
````
docker pull ubuntu
````
## Create Cont and Mount Vol
````
docker run -itd --name c1 --mount source=myvol,target=/oncdecb29 ubuntu
````
## list running cont
````
docker ps
````
## login into docker cont
````
docker exec -it c1 /bin/bash
````
````
cd oncdecb29
````
## create files
````
touch index.html error.html style.css
````
## exit from cont

## Create Another Cont and Mount Vol
````
docker run -itd --name c2 --mount source=myvol,target=/drive ubuntu
````
## list running cont
````
docker ps
````
## login into docker cont
````
docker exec -it c2 /bin/bash
````
cd drive

ls
