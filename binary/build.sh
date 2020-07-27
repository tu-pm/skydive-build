[[ ! -z $1 ]] && TAG=$1 || TAG=latest
cd ~/go/src/github.com/skydive-project/skydive && make
cd $OLDPWD
mv ~/go/bin/skydive .
docker build -t 10.240.201.50:8891/visualizer/skydive:$TAG .
#docker push 10.240.201.50:8891/visualizer/skydive:$TAG
