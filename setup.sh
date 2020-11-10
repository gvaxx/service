minikube start --vm-driver=virtualbox

eval $(minikube docker-env)
minikube addons enable metallb
minikube dashboard & 

kubectl apply -f srcs/metallb_config.yaml

kubectl apply -f srcs/influx.yaml
docker build -t inf_image srcs/influxDB

kubectl apply -f srcs/grafana.yaml
docker build -t grafana_image srcs/grafana

kubectl apply -f srcs/nginx.yaml
docker build -t nginx_image srcs/nginx

kubectl apply -f srcs/ftp.yaml
docker build -t ftp_image srcs/ftp

kubectl apply -f srcs/mysql.yaml
docker build -t mysql_image srcs/mysql

kubectl apply -f srcs/wordpress.yaml
docker build -t wp_image srcs/wordpress

kubectl apply -f srcs/pma.yaml
docker build -t pma_image srcs/PMA