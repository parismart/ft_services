#!/bin/sh

# Colors.
GREEN='\033[0;32m'
BLUE='\033[0;34m'
END='\033[0;0m'

# Kill all processes.
minikube delete
killall -TERM kubectl minikube VBoxHeadless

# Start minikube.
minikube start --driver=virtualbox

# Use the docker daemon from minikube.
eval $(minikube docker-env)

# Build docker images.
echo "${GREEN}Docker build init${END}"
docker build -t my_nginx srcs/nginx > /dev/null 2>&1
docker build -t my_wordpress srcs/wordpress > /dev/null 2>&1
docker build -t my_mysql srcs/mysql > /dev/null 2>&1
docker build -t my_phpmyadmin srcs/phpmyadmin > /dev/null 2>&1
docker build -t my_ftps srcs/ftps > /dev/null 2>&1
docker build -t my_grafana srcs/grafana > /dev/null 2>&1
docker build -t my_influxdb srcs/influxdb > /dev/null 2>&1
echo "${BLUE}Docker build completed${END}"

# Apply yaml resources.
echo "${GREEN}Deploy init${END}"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl apply -f srcs/metalLB.yaml
kubectl apply -f srcs/nginx.yaml
kubectl apply -f srcs/mysql.yaml
kubectl apply -f srcs/ftps.yaml
kubectl apply -f srcs/phpmyadmin.yaml
kubectl apply -f srcs/wordpress.yaml
kubectl apply -f srcs/grafana.yaml
kubectl apply -f srcs/influxdb.yaml
echo "${BLUE}Deploy completed${END}"

# Setup metalLB secret.
kubectl create secret generic -n metallb-system memberlist  --from-literal=secretkey="$(openssl rand -base64 128)"

# Enable addons.
minikube addons enable dashboard
minikube addons enable ingress
minikube addons enable metrics-server

# Open dashboard.
minikube dashboard
