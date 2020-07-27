set -e
[[ ! -z $1 ]] && TAG=$1 || TAG=latest
docker build -t 10.240.201.50:8891/visualizer/skydive_ui:$TAG .
docker push 10.240.201.50:8891/visualizer/skydive_ui:$TAG
